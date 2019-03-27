using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessAccessLayer
{
  public  class Enum_
    {

      public   enum NotificationType :int
      {
          SendToAllFriend = 1, SendToSingleFriend=2, FinalAction=3
      }

        public enum MessageType
        {
            Error, Warning, FinalAction
        }
        public enum InternalSessionKey : short
        {
            UserProfileKey, Limit
        }
        public enum PageName : short
        {
            Home, Login
        }
    
    }
}
