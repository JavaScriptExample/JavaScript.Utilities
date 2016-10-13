using System;

public class Location
{
    public int ID
    {
        get;    // int, not null
        set;
    }
    
    public string LocalNum
    {
        get;    // varchar(20), not null
        set;
    }
    
    public string LocalBarCode
    {
        get;    // varchar(20), not null
        set;
    }
    
    public string LocalName
    {
        get;    // nvarchar(30), not null
        set;
    }
    
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
    
    public double Length
    {
        get;    // float, not null
        set;
    }
    
    public double Width
    {
        get;    // float, not null
        set;
    }
    
    public double Height
    {
        get;    // float, not null
        set;
    }
    
    public double X
    {
        get;    // float, not null
        set;
    }
    
    public double Y
    {
        get;    // float, not null
        set;
    }
    
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
    
    public string UnitName
    {
        get;    // varchar(20), not null
        set;
    }
    
    public string Remark
    {
        get;    // nvarchar(4000), null
        set;
    }
    
    public int IsForbid
    {
        get;    // int, not null
        set;
    }
    
    public int IsDefault
    {
        get;    // int, not null
        set;
    }
    
    public int IsDelete
    {
        get;    // int, not null
        set;
    }
    
    public DateTime CreateTime
    {
        get;    // datetime, not null
        set;
    }
}
