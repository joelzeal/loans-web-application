using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using PortSight.SecureAccess.ARObjects;
using System.Globalization;
using System.Threading;

namespace LoanWebApplication4
{
    public class Global : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            // Code that runs on application startup
            //create resource manager and store it in the application variable

            System.Resources.ResourceManager Resman = null;
            try
            {
                // Build on version 1.X
                System.Reflection.Assembly assmbl = null;
                assmbl = System.Reflection.Assembly.Load("SecureAccess");
                Resman = new System.Resources.ResourceManager("SecureAccess.strings", assmbl);
            }
            catch
            {
                // Build on version 2.X
                Resman = new System.Resources.ResourceManager("Resources.strings", System.Reflection.Assembly.Load("App_GlobalResources"));
            }
            Application["RM"] = Resman;

            //check if all changes made using the Secure Access user interface should be stored in the auditing log
            ARConnection arcn = new ARConnection();
            arcn.ConnectToCatalog();

            if (arcn.GetCatalogObject().GetPropertyValue(ARCatalogSettingsConstants.cLOG_ALL_CHANGES) == "1")
            {
                Application["LogAllChanges"] = "1";
            }
            else
            {
                Application["LogAllChanges"] = "0";
            }

            if (arcn.GetCatalogObject().GetPropertyValue(ARCatalogSettingsConstants.cSTORE_LOGON_ATTEMPTS_IN_AUDITING_LOG) == "1")
            {
                Application["StoreLogonAttemptsInAuditingLog"] = "1";
            }
            else
            {
                Application["StoreLogonAttemptsInAuditingLog"] = "0";
            }
            arcn.Close();
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        void Application_BeginRequest(object sender, EventArgs e)
        {
            CultureInfo newCulture = (CultureInfo)System.Threading.Thread.CurrentThread.CurrentCulture.Clone();
            newCulture.DateTimeFormat.ShortDatePattern = "dd-MMM-yyyy";
            newCulture.DateTimeFormat.LongDatePattern = "dd-MMMM-yyyy";

            newCulture.NumberFormat.CurrencySymbol = "GH¢";
           
            newCulture.DateTimeFormat.DateSeparator = "-";
            Thread.CurrentThread.CurrentCulture = newCulture;






         

        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started

        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

        }

    }
}
