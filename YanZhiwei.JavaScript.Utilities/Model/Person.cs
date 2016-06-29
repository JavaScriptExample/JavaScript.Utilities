using Newtonsoft.Json;

namespace YanZhiwei.JavaScript.Utilities.Model
{
    public class Person
    {
        [JsonProperty("序号")]
        public int Id { get; set; }

        [JsonProperty("姓名")]
        public string Name { get; set; }

        [JsonProperty("年龄")]
        public ushort Age { get; set; }

        [JsonIgnore]//忽悠
        public string Address { get; set; }
    }
}