using System;
using System.ComponentModel;

public class Location
{
    public int ID
    {
        get;    // int, not null
        set;
    }
    
    [DisplayName("序号")]
    public string LocalNum
    {
        get;    // varchar(20), not null
        set;
    }
    
    [DisplayName("仓库编号")]
    public string LocalBarCode
    {
        get;    // varchar(20), not null
        set;
    }
    
    [DisplayName("仓库名")]
    public string LocalName
    {
        get;    // nvarchar(30), not null
        set;
    }
    
    [DisplayName("仓库类型")]
    public string StorageNum
    {
        get;    // varchar(20), not null
        set;
    }
    
    public int StorageType
    {
        get;    // int, not null
        set;
    }
    
    public int LocalType
    {
        get;    // int, not null
        set;
    }
    
    public string Rack
    {
        get;    // nvarchar(100), null
        set;
    }
    
    [DisplayName("长度")]
    public double Length
    {
        get;    // float, not null
        set;
    }
    
    [DisplayName("宽度")]
    public double Width
    {
        get;    // float, not null
        set;
    }
    
    [DisplayName("高度")]
    public double Height
    {
        get;    // float, not null
        set;
    }
    
    [DisplayName("X")]
    public double X
    {
        get;    // float, not null
        set;
    }
    
    [DisplayName("Y")]
    public double Y
    {
        get;    // float, not null
        set;
    }
    
    [DisplayName("Z")]
    public double Z
    {
        get;    // float, not null
        set;
    }
    
    public string UnitNum
    {
        get;    // varchar(20), not null
        set;
    }
    
    [DisplayName("单位")]
    public string UnitName
    {
        get;    // varchar(20), not null
        set;
    }
    
    [DisplayName("备注")]
    public string Remark
    {
        get;    // nvarchar(4000), null
        set;
    }
    
    [DisplayName("是否禁止")]
    public int IsForbid
    {
        get;    // int, not null
        set;
    }
    
    [DisplayName("是否默认")]
    public int IsDefault
    {
        get;    // int, not null
        set;
    }
    
    [DisplayName("是否删除")]
    public int IsDelete
    {
        get;    // int, not null
        set;
    }
    
    [DisplayName("创建时间")]
    public DateTime CreateTime
    {
        get;    // datetime, not null
        set;
    }
}