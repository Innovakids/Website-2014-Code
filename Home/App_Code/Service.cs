using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Activation;
using Microsoft.VisualBasic;

using System.Collections;

using System.Data;
using System.Diagnostics;

using System.IO;
using System.Runtime.Serialization;
using System.ServiceModel;

using System.Text;
using System.Data.SqlClient;

// NOTE: If you change the class name "Service" here, you must also update the reference to "Service" in Web.config and in the associated .svc file.
[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
public class Service : IService
{

    
    public string GetData(int value)
    {
        return string.Format("You entered: {0}", value);
    }

    public string GetLogin(string Id, string Password)
    {
        return new User().GetLogin(Id,Password);
    }

    public string[] GetUser(string Id)
    {
        return new User().GetUser(Convert.ToInt32(Id));
    }
}



public class User
{


    private const string connectionString = "Data Source=s02.winhost.com;Initial Catalog=DB_6956_innovakids;Persist Security Info=True;User ID=DB_6956_innovakids_user;Password=foll2164";
    //private const string connectionString = "Data Source=sbcoe-pssql2;Initial Catalog=Financial2000_Master;Persist Security Info=True;User ID=financial2000;Password=Garden0fEv@";



    Dictionary<int, string> users = null;

    public User()
    {
          


        users = new Dictionary<int, string>();
        users.Add(1, "First");
        users.Add(2, "Krunal2");
        users.Add(3, "Aditya3");
        users.Add(4, "Samir4");
    }

    public string[] GetUser(int Id)
    {
        var user = from u in users
                   where u.Key == Id
                   select u.Value;

        return user.ToArray<string>();
    }

    public string GetLogin(string Id, string Password)
    {

        //string strReturn = GetDataString("Select Top 1 SchoolNo, School, City, State from School where email = '" + Id + "' and password = '" + Id + "'", 1, 1);
        string strReturn = GetDataString("Select  t.TeacherNo, t.SchoolNo, s.School, t.Name , s.AdminEmail, t.SecurityCodes, s.District  from dbo.LoginView t inner join school s on s.SchoolNo = t.SchoolNo  where t.Email = '" + Id + "' And t.Password = '" + Password + "' Order By t.TeacherNo",1,1);
             
       
        return strReturn;

    }

	public DataSet GetDataSet(string SQL, int PageNumber, int PageSize)
	{
		DataSet ds = null;
		SqlConnection Connection = new SqlConnection(connectionString);
		try {
			Connection.Open();
			SqlDataAdapter adapter = new SqlDataAdapter();
			adapter.SelectCommand = new SqlCommand(SQL);

			adapter.SelectCommand.Connection = Connection;
			if (PageSize > 0) {
				// Set rowcount =PageNumber * PageSize for best performance
				long RowCount = PageNumber * PageSize;
				SqlCommand cmd = new SqlCommand("SET ROWCOUNT " + RowCount.ToString() + " SET NO_BROWSETABLE ON", (SqlConnection)Connection);
				cmd.ExecuteNonQuery();
			}
			ds = new DataSet();
			adapter.Fill(ds, (PageNumber - 1) * PageSize, PageSize, "Data");
			adapter.FillSchema(ds, SchemaType.Mapped, "DataSchema");
		
		} catch (Exception err) {
			throw err;
		} finally {
			Connection.Close();
		}
		return ds;
	}


    public String GetDataString(string SQL, int PageNumber, int PageSize)
    {
        DataSet ds = null;
        SqlConnection Connection = new SqlConnection(connectionString);
        try
        {
            Connection.Open();
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand(SQL);

            adapter.SelectCommand.Connection = Connection;
            if (PageSize > 0)
            {
                // Set rowcount =PageNumber * PageSize for best performance
                long RowCount = PageNumber * PageSize;
                SqlCommand cmd = new SqlCommand("SET ROWCOUNT " + RowCount.ToString() + " SET NO_BROWSETABLE ON", (SqlConnection)Connection);
                cmd.ExecuteNonQuery();
            }
            ds = new DataSet();
            adapter.Fill(ds, (PageNumber - 1) * PageSize, PageSize, "Data");
            adapter.FillSchema(ds, SchemaType.Mapped, "DataSchema");
            //If PageSize > 0 Then
            //    ' Reset Rowcount back to 0
            //    Dim cmd As New SqlCommand("SET ROWCOUNT 0 SET NO_BROWSETABLE OFF", DirectCast(Connection, SqlConnection))
            //    cmd.ExecuteNonQuery()
            //End If
            //If ds.Tables.Count > 1 Then
            //    Dim data As DataTable = ds.Tables("Data")
            //    Dim schema As DataTable = ds.Tables("DataSchema")
            //    data.Merge(schema)
            //    ds.Tables.Remove(schema)
            //End If
        }
        catch (Exception err)
        {
            throw err;
        }
        finally
        {
            Connection.Close();
        }


        string strReturn = ds.Tables[0].Rows[0]["DISTRICT"].ToString() + "," + ds.Tables[0].Rows[0]["SCHOOL"].ToString() + "," + ds.Tables[0].Rows[0]["NAME"].ToString() + "," + ds.Tables[0].Rows[0]["SCHOOLNO"].ToString();


        return strReturn;
    }


	public bool ExecuteSql(string SQL)
	{
		bool blnReturn = true;

		SqlConnection Connection = new SqlConnection(connectionString);
		try {
			Connection.Open();

			SqlCommand cmd = new SqlCommand(SQL, (SqlConnection)Connection);
			cmd.ExecuteNonQuery();

		} catch (Exception err) {
			blnReturn = false;
		} finally {
			Connection.Close();
		}
		return blnReturn;
	}

	public string ExecuteScalar(string SQL)
	{
		string strReturn = "";

		SqlConnection Connection = new SqlConnection(connectionString);
		try {
			Connection.Open();

			SqlCommand cmd = new SqlCommand(SQL, (SqlConnection)Connection);

          
            strReturn = cmd.ExecuteScalar().ToString();

		} catch (Exception err) {
			strReturn = "";
		} finally {
			Connection.Close();
		}
		return strReturn;
	}


}

