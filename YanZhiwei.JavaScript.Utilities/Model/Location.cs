using System;
using System.ComponentModel;

public class Location
{
    public int ID
    {
        get;    // int, not null
        set;
    }
    
    [DisplayName("���")]
    public string LocalNum
    {
        get;    // varchar(20), not null
        set;
    }
    
    [DisplayName("�ֿ���")]
    public string LocalBarCode
    {
        get;    // varchar(20), not null
        set;
    }
    
    [DisplayName("�ֿ���")]
    public string LocalName
    {
        get;    // nvarchar(30), not null
        set;
    }
    
    [DisplayName("�ֿ�����")]
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
    
    [DisplayName("����")]
    public double Length
    {
        get;    // float, not null
        set;
    }
    
    [DisplayName("���")]
    public double Width
    {
        get;    // float, not null
        set;
    }
    
    [DisplayName("�߶�")]
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
    
    [DisplayName("��λ")]
    public string UnitName
    {
        get;    // varchar(20), not null
        set;
    }
    
    [DisplayName("��ע")]
    public string Remark
    {
        get;    // nvarchar(4000), null
        set;
    }
    
    [DisplayName("�Ƿ��ֹ")]
    public int IsForbid
    {
        get;    // int, not null
        set;
    }
    
    [DisplayName("�Ƿ�Ĭ��")]
    public int IsDefault
    {
        get;    // int, not null
        set;
    }
    
    [DisplayName("�Ƿ�ɾ��")]
    public int IsDelete
    {
        get;    // int, not null
        set;
    }
    
    [DisplayName("����ʱ��")]
    public DateTime CreateTime
    {
        get;    // datetime, not null
        set;
    }
}