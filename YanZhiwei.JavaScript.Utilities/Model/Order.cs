using System;

public class Order
{
    public Order()
    {
        this.Freight = 0M;
    }
    
    public int OrderID
    {
        get;    // int, not null
        set;
    }
    
    public string CustomerID
    {
        get;    // nchar(5), null
        set;
    }
    
    public int? EmployeeID
    {
        get;    // int, null
        set;
    }
    
    public DateTime? OrderDate
    {
        get;    // datetime, null
        set;
    }
    
    public DateTime? RequiredDate
    {
        get;    // datetime, null
        set;
    }
    
    public DateTime? ShippedDate
    {
        get;    // datetime, null
        set;
    }
    
    public int? ShipVia
    {
        get;    // int, null
        set;
    }
    
    public decimal? Freight
    {
        get;    // money, null
        set;
    }
    
    public string ShipName
    {
        get;    // nvarchar(40), null
        set;
    }
    
    public string ShipAddress
    {
        get;    // nvarchar(60), null
        set;
    }
    
    public string ShipCity
    {
        get;    // nvarchar(15), null
        set;
    }
    
    public string ShipRegion
    {
        get;    // nvarchar(15), null
        set;
    }
    
    public string ShipPostalCode
    {
        get;    // nvarchar(10), null
        set;
    }
    
    public string ShipCountry
    {
        get;    // nvarchar(15), null
        set;
    }
}
