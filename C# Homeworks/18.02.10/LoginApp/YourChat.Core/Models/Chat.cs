//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace YourChat.Core.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Chat
    {
        public Chat()
        {
            this.ChatMessages = new HashSet<ChatMessage>();
            this.Users = new HashSet<User>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<decimal> Rate { get; set; }
        public int CategoryId { get; set; }
    
        public virtual CategoryOfChat CategoryOfChat { get; set; }
        public virtual ICollection<ChatMessage> ChatMessages { get; set; }
        public virtual ICollection<User> Users { get; set; }
    }
}
