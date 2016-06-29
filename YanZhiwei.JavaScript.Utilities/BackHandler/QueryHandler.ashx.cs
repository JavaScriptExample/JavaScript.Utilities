using System.Collections.Generic;
using System.Web;
using YanZhiwei.DotNet.Newtonsoft.Json.Utilities;
using YanZhiwei.JavaScript.Utilities.Model;

namespace YanZhiwei.JavaScript.Utilities.BackHandler
{
    /// <summary>
    /// Summary description for QueryHandler
    /// </summary>
    public class QueryHandler : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            string _action = context.Request.Params.Get("action");
            HanlderQueryPerons(_action, context);
        }

        private void HanlderQueryPerons(string action, HttpContext context)
        {
            if (string.Compare(action, "queryperson", true) == 0)
            {
                List<Person> personList = new List<Person>();
                for (ushort i = 0; i < 10; i++)
                {
                    Person _person = new Person();
                    _person.Id = i;
                    _person.Age = i;
                    _person.Name = string.Concat("yanzhiwei", i);
                    personList.Add(_person);
                }
                string _jsonString = JsonHelper.Serialize(personList);
                context.Response.Write(_jsonString);
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