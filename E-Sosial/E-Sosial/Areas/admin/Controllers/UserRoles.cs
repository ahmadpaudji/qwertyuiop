using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace E_Sosial.Areas.admin.Controllers
{
    public class UserRoles : RoleProvider
    {
        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override string ApplicationName
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }

        public override string[] GetRolesForUser(string username)
        {
            using (db_esosEntities db = new db_esosEntities())
            {
                var user = db.users.FirstOrDefault(u => u.username == username);
                if (user == null)
                {
                    return null;
                }
                else
                {
                    
                    var id_user = (from table in db.users where table.username == username select table.id_user).FirstOrDefault();
                    var userRolesID = (from table in db.detail_roles where table.id_user == id_user select table.id_roles).FirstOrDefault();
                    var userRoles = (from table in db.roles where table.id_roles == userRolesID select table.roles).FirstOrDefault();
                 
                    
                    return new[] { userRoles};
                }
            }
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            throw new NotImplementedException();
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }
}