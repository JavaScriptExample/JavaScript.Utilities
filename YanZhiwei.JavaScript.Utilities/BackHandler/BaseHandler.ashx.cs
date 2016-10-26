using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using YanZhiwei.DotNet.NPOI2.Utilities;
using YanZhiwei.DotNet2.Utilities.Collection;
using YanZhiwei.DotNet2.Utilities.Common;
using YanZhiwei.DotNet2.Utilities.DataOperator;
using YanZhiwei.DotNet2.Utilities.Enum;
using YanZhiwei.DotNet3._5.Utilities.Common;
using YanZhiwei.DotNet3._5.Utilities.Mapper;
using YanZhiwei.DotNet3._5.Utilities.Model;
using YanZhiwei.DotNet3._5.Utilities.WebForm.JqueryPlugin;
using YanZhiwei.JavaScript.Utilities.Model;
using YanZhiwei.DotNet3._5.Utilities.WebForm;
namespace YanZhiwei.JavaScript.Utilities.BackHandler
{
    /// <summary>
    /// Summary description for BaseHandler
    /// </summary>
    public class BaseHandler : IHttpHandler
    {
        public static IEnumerable<Person> GetPersons()
        {
            for(int i = 0; i < 57; i++)
            {
                yield return new Person
                {
                    Id = i,
                    Name = "name " + i
                };
            }
        }
        
        public void ProcessRequest(HttpContext context)
        {
            string _actionType = context.Request.Params["action"].ToStringOrDefault("UnKown");
            
            if(_actionType.CompareIgnoreCase("getLocationList"))
            {
                int _pageIndex = context.Request.Params["PageIndex"].ToInt32OrDefault(1),
                    _pageSize = context.Request.Params["PageSize"].ToInt32OrDefault(10);
                SqlServerDataOperator _helper = new SqlServerDataOperator(@"Server=YANZHIWEI-IT-PC\SQLEXPRESS;database=Northwind;user id=sa;Password=sasa");
                PagedList<Order> _pageResult = _helper.ExecutePageQuery<Order>("[Orders]", "*", "OrderID", OrderType.Desc, string.Empty, _pageSize, _pageIndex);
                string _json = SerializeHelper.JsonSerialize(new JsonPagedList<Order>(_pageResult)).ParseJsonDateTime();
                context.Response.Write(_json);
            }
            else if(_actionType.CompareIgnoreCase("exportLocationExcel"))
            {
                SqlServerDataOperator _helper = new SqlServerDataOperator(@"Server=YANZHIWEI-IT-PC\SQLEXPRESS;database=JooWMS;user id=sa;Password=sasa");
                PagedList<Location> _pageResult = _helper.ExecutePageQuery<Location>("[Location]", "*", "ID", OrderType.Desc, string.Empty, 10, 1);
                DataTable _result = GeneralMapper.ToDataTable<Location>(_pageResult, new string[4] { "LocalNum", "LocalBarCode", "LocalName", "StorageNum" });
                string _filePath = context.Server.MapPath("~/UploadFiles/");
                
                if(!Directory.Exists(_filePath))
                {
                    Directory.CreateDirectory(_filePath);
                }
                
                string _filename = string.Format("库位管理{0}.xls", DateTime.Now.ToString("yyyyMMddHHmmss"));
                NPOIExcel.ToExcel(_result, "库位管理", "库位", Path.Combine(_filePath, _filename));
                context.CreateResponse(("/UploadFiles/" + _filename).Escape(), AjaxResultType.Success, string.Empty);
            }
            else
            {
                context.ExecutePageQuery<Person>((pageLength, pageIndex, orderIndex, orderBy) =>
                {
                    var persons = GetPersons();
                    Func<Person, object> order = p =>
                    {
                        if(orderIndex == 0)
                        {
                            return p.Id;
                        }
                        
                        return p.Name;
                    };
                    
                    if("desc" == orderBy)
                    {
                        persons = persons.OrderByDescending(order);
                    }
                    else
                    {
                        persons = persons.OrderBy(order);
                    }
                    
                    //错误测试
                    //DataTablePageResult result = new DataTablePageResult();
                    //result.ExecuteMessage = "测试错误";
                    //result.ExecuteState = HttpStatusCode.BadGateway;
                    //正确测试
                    DataTablePageResult result = new DataTablePageResult();
                    result.iTotalDisplayRecords = persons.Count();
                    List<Person> _personList = new List<Person>();
                    result.iTotalRecords = persons.Count();
                    result.aaData = persons.Skip(pageIndex).Take(pageLength);
                    result.ExecuteState = HttpStatusCode.OK;
                    return result;
                });
                // // Those parameters are sent by the plugin
                // var iDisplayLength = int.Parse(context.Request["iDisplayLength"]);
                // var iDisplayStart = int.Parse(context.Request["iDisplayStart"]);
                // var iSortCol = int.Parse(context.Request["iSortCol_0"]);
                // var iSortDir = context.Request["sSortDir_0"];
                // // Fetch the data from a repository (in my case in-memory)
                // var persons = GetPersons();
                // // Define an order function based on the iSortCol parameter
                // Func<Person, object> order = p =>
                // {
                //     if (iSortCol == 0)
                //     {
                //         return p.Id;
                //     }
                //     return p.Name;
                // };
                // // Define the order direction based on the iSortDir parameter
                // if ("desc" == iSortDir)
                // {
                //     persons = persons.OrderByDescending(order);
                // }
                // else
                // {
                //     persons = persons.OrderBy(order);
                // }
                // // prepare an anonymous object for JSON serialization
                // var result = new
                // {
                //     iTotalRecords = persons.Count(),
                //     iTotalDisplayRecords = persons.Count(),
                //     aaData = persons
                //         .Skip(iDisplayStart)
                //         .Take(iDisplayLength)
                // };
                // //var serializer = new JavaScriptSerializer();
                //// var json = SerializationHelper.JsonSerialize(result);// serializer.Serialize(result);
                //  context.CreateResponse(result, System.Net.HttpStatusCode.OK);
                // //context.Response.ContentType = "application/json";
                // //context.Response.Write(json);
            }
        }
        
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}