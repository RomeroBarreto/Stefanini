using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using Dapper;
using Stefanini.PraticalTest.Models;

namespace Stefanini.PraticalTest.DAL
{
    public class AppContext
    { 
        public UserSys GetByEmail(string email)
        {
            using (var conn = new SqlConnection(GetConnectionString()))
            {
                return conn.Query<UserSys>(@"SELECT u.[Id],[Login]
                              ,[Email]
                              ,[Password]
                              ,r.IsAdmin
                          FROM [UserSys] u 
                    inner join UserRole r on u.UserRoleId = r.id 
                    where Email = @email", new { email })
                    .FirstOrDefault();
            }
        }
        
        public IList<Customer> FindCustomers(CustomerSearchRequest model)
        {
            if (model.Name != null)
            {
                model.Name = "%" + model.Name + "%";
            }
            
            using (var conn = new SqlConnection(GetConnectionString()))
            {
                return conn.Query<Customer>(@"SELECT c.[Id]
                                                  ,c.[Name]
                                                  ,c.[Phone]
                                                  ,g.Name as Gender
                                                  ,ci.Name as [City]
                                                  ,r.Name as [Region]
                                                  ,c.[LastPurchase]
                                                  ,cl.Name as [Classification]
                                                  , u.Login as [Seller]
                                              FROM [Customer] c 
                                              inner join Gender g on g.id = c.genderid
                                              inner join City ci on ci.id = c.cityid
                                              inner join Region r on r.id = c.regionid
                                              inner join Classification cl on cl.id = c.classificationid
                                              inner join UserSys u on u.id = c.userid
                                            where (@Name is null or c.Name like @Name) and
                                                   (@GenderId is null or GenderId = @GenderId) and
                                                   (@CityId is null or CityId = @CityId) and
                                                   (@RegionId is null or c.RegionId = @RegionId) and
                                                   (@ClassificationId is null or ClassificationId = @ClassificationId) and
                                                   (@SellerId is null or UserId = @SellerId) and
                                                   (@LastPurchase is null or LastPurchase >= @LastPurchase) and
                                                   (@Until is null or LastPurchase <= @Until)",
                    model).ToList();

            }
        }
        
        public IList<City> GetCities()
        {
            using (var conn = new SqlConnection(GetConnectionString()))
            {
                return conn.Query<City>(@"SELECT [Id], [Name], RegionId FROM [City]").ToList();
            }
        }

        public IList<Gender> GetGenders()
        {
            using (var conn = new SqlConnection(GetConnectionString()))
            {
                return conn.Query<Gender>(@"SELECT [Id], [Name] FROM [Gender]").ToList();
            }
        }

        public IList<Seller> GetSellers()
        {
            using (var conn = new SqlConnection(GetConnectionString()))
            {
                return conn.Query<Seller>(@"select u.id, login from [UserSys] u inner join UserRole r on u.userroleid = r.id and r.isadmin = 0").ToList();
            }
        }
        
        public  IList<Classification> GetClassifications()
        {
            using (var conn = new SqlConnection(GetConnectionString()))
            {
                return conn.Query<Classification>(@"select id, Name from [Classification]").ToList();
            }
        }

        public IList<Region> GetRegions()
        {
            using (var conn = new SqlConnection(GetConnectionString()))
            {
                return conn.Query<Region>(@"select id, Name from [Region]").ToList();
            }
        }
        
        public Region GetRegionByCityId(int cityId)
        {
            using (var conn = new SqlConnection(GetConnectionString()))
            {
                return conn.Query<Region>(@"SELECT r.[Id], r.[Name] FROM [City] c inner join Region r on r.id = c.regionid where c.id = @CityId", new { CityId = cityId }).FirstOrDefault();
            }
        }
        
        private string GetConnectionString()
        {
            return ConfigurationManager.AppSettings["ConnectionString"];
        }

    }
}