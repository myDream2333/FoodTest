using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace LazyEating.Repository
{
    public static class SqlHelper
    {
        // 对连接执行 Transact-SQL 语句并返回受影响的行数。
        public static int ExecQueryString(string ConnString, string QueryString)
        {
            //定义新的数据连接控件并初始化
            using (SqlConnection Conn = new SqlConnection(ConnString))
            {
                SqlCommand Comm = new SqlCommand(QueryString, Conn);

                Conn.Open();//打开连接
                int i = Comm.ExecuteNonQuery();//执行命令
                Conn.Close();//关闭连接

                return i;
            }

        }
    }
}
