using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Data.SqlClient;

namespace Data
{
    public class CompanyRepository:BaseConnection
    {
        public ResponseService<long> Save(Company _company)
        {
            ResponseService<long> Response = new ResponseService<long>();
            try
            {
                using (Conn)
                {
                    Conn.Open();
                    using (SqlCommand cmd = new SqlCommand("Sp_Api_IU_Company", Conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;


                        cmd.Parameters.AddWithValue("@CompanyId", _company.CompanyId);
                        cmd.Parameters["@CompanyId"].Direction = System.Data.ParameterDirection.InputOutput;
                        cmd.Parameters["@CompanyId"].Size = 64;

                        cmd.Parameters.AddWithValue("@CompanyName", _company.Name);
                        cmd.Parameters.AddWithValue("@FoundationDate", _company.FoundationDate);
                        cmd.Parameters.AddWithValue("@ContactPhone", _company.ContactPhone);
                        cmd.Parameters.AddWithValue("@Representative", _company.Representative);

                        cmd.Parameters.AddWithValue("@Street", _company.Address.Street);
                        cmd.Parameters.AddWithValue("@InStreetNumber", _company.Address.InStreetNumber);
                        cmd.Parameters.AddWithValue("@ExStreetNumber", _company.Address.ExStreetNumber);
                        cmd.Parameters.AddWithValue("@Neighborhood", _company.Address.Neighborhood);
                        cmd.Parameters.AddWithValue("@City", _company.Address.City);
                        cmd.Parameters.AddWithValue("@State", _company.Address.State);
                        cmd.Parameters.AddWithValue("@Country", _company.Address.Country);
                        cmd.Parameters.AddWithValue("@Latitude", _company.Address.Latitude);
                        cmd.Parameters.AddWithValue("@Longitude", _company.Address.Longitude);

                        cmd.ExecuteNonQuery();

                        Response.Result = Convert.ToInt64(cmd.Parameters["@CompanyId"].Value);

                    }
                }
            }
            catch (Exception ex)
            {
                Response.Error = true;
                Response.Message = ex.InnerException == null ? ex.Message : ex.InnerException.Message;
            }
            return Response;
        }
    }
}
