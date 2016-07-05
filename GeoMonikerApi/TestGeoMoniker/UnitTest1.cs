using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Model;
using Data;
using System.Windows.Forms;

namespace TestGeoMoniker
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            Company _company = new Company();
            
            _company.Name = "ATOM";
            _company.FoundationDate = DateTime.Now;
            _company.Representative = "Edrei Javier Bastar Sarao";
            _company.ContactPhone = "9212408081";

            _company.Address.Street = "Tordo";
            _company.Address.InStreetNumber = "701";
            _company.Address.ExStreetNumber = "21 A";
            _company.Address.City = "CDMX";
            _company.Address.State = "CDMX";
            _company.Address.Country = "Mexico";
            _company.Address.Neighborhood = "Tacubaya";
            _company.Address.Latitude = Convert.ToDecimal(19.400453);
            _company.Address.Longitude =Convert.ToDecimal(-99.189098);

            CompanyRepository repository = new CompanyRepository();
            var response=repository.Save(_company);
            
            if (response.Error)
                MessageBox.Show("Error se genero el siguiente error "+ response.Message);
            else
                MessageBox.Show("Numero de Compañia '"+ response.Result.ToString()+"'");

        }
    }
}
