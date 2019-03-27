using System;
using System.Collections.Generic;
using System.Text;

namespace AdvertisementManagement
{
    public static class Enumerations
    {
        public enum ValidationErrors
        {
            Has_Error = -1,
            string_empty = -100000,
            string_lengh = -100001,
            date_notInCorrectFormat = -100002,
            IncorrectPriorityNumbers = -100003,
            Cant_Delete = -100004,
            int_notInrange = -100040,
            RepeatEmail = -100041,
            RepeatUserName = -100044,
            IncorrectSecurityImage = -100045,
            ExistPlayer = -100046,
            Field_empty = -100011,
            ddl_empty = -100012,
            notCompositionPlayer = -100050
        }

        public enum ProfileInformationErrors
        {
            isJobExperiment = -100100,
            isEducation = -100101,
            isPersonalContact = -100102,
            iseCommerceContact = -100103,
            isLanguageSkill = -100104,
            isContactEmail = -100105,
            isContactPhone = -100106
        }

        public enum AllowUpdate
        {
            Allow = 0,
            Not_Allow = 1
        }

        public enum AccessPermission
        {
            NotDefine = 0,
            NoAccess = 1,
            Access = 2
        }

        public enum Actions
        {
            Insert = 1,
            Update = 2,
            Delete = 3,
            View = 4
        }

        public enum MembersMode
        {
            Null = 0,
            Users = 1,
            Groups = 2
        }

        public enum enumValidationMessage
        {
            Insert = -100009,
            Edit = -100008,
            Delete = -100010
        }

        public enum enumParameterType
        {
            Nemerical = 1,
            Letter,
            DateTime,
            Table
        }

        public enum BannerType
        {
            TextLink = 1,
            Image = 2,
            Flash = 3
        }
    }
}
