﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;
using System.Runtime.InteropServices;
using Microsoft.Win32;
namespace WebApp
{
    public class globals
    {
        [DllImport("kernel32.dll", SetLastError = true)]
        public static extern bool AllocConsole();

        [DllImport("kernel32.dll", SetLastError = true)]
        public static extern bool FreeConsole();

        [DllImport("kernel32", SetLastError = true)]
        public static extern bool AttachConsole(int dwProcessId);

        public static class DBINFO
        {
            public static string HOST = "sotignetwork.ddns.net";
            public static string PORT = "3306";
            public static string NAME = "team_project";
            public static string USERNAME = "root";
            public static string PASSWORD = "sotig19951995!";
            public static MySqlConnection DATABASE_INSTANCE;
            public static bool INSTANTIATE_DATABASE()
            {
                try
                {
                    DATABASE_INSTANCE = new MySqlConnection("Server=" + HOST + ";" + "Database=" + NAME + ";" + "Uid=" + USERNAME + ";" + "Pwd=" + PASSWORD + ";");
                    DATABASE_INSTANCE.Open();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
            public static string SEND_QUERY(string SQL_QUERY)
            {
                MySqlCommand COMMAND = DATABASE_INSTANCE.CreateCommand();
                COMMAND.CommandText = SQL_QUERY;
                return "";
            }
            public static void CLOSE_CONNECTION()
            {
                DATABASE_INSTANCE.Clone();
            }
        }


    }
}