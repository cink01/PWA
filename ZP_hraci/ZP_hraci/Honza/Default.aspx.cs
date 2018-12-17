using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\zp_db.mdf;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("select id,nazev from postavy", conn);
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;
        string temp = "";
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {

            temp += reader["id"].ToString();
            temp += " | ";
            temp += reader["nazev"].ToString();
            temp += "<br/>";

        }
        conn.Close();
        lb_postavy.Text = temp;
    }

    protected void Button_insert_Click(object sender, EventArgs e)
    {
        SqlCommand insert = new SqlCommand("insert into [hraci] (jmeno,level,strenght,dexterity,constitution,inteligence,wisdom,charisma,hrac,dm,postava) " +
            "values(@jmeno, @level,@strenght,@dexterity,@constitution,@inteligence,@wisdom,@charisma,@hrac,@dm,@postava)", conn);
        insert.Parameters.AddWithValue("@jmeno", TextBox_jméno.Text);
        insert.Parameters.AddWithValue("@level", Convert.ToInt32(tb_level.Text));
        insert.Parameters.AddWithValue("@strenght", Convert.ToInt32(tb_str.Text));
        insert.Parameters.AddWithValue("@dexterity", Convert.ToInt32(tb_dex.Text));
        insert.Parameters.AddWithValue("@constitution", Convert.ToInt32(tb_con.Text));
        insert.Parameters.AddWithValue("@inteligence", Convert.ToInt32(tb_int.Text));
        insert.Parameters.AddWithValue("@wisdom", Convert.ToInt32(tb_wis.Text));
        insert.Parameters.AddWithValue("@charisma", Convert.ToInt32(tb_cha.Text));
        insert.Parameters.AddWithValue("@hrac", Session["login"].ToString());
        insert.Parameters.AddWithValue("@dm", 1);
        insert.Parameters.AddWithValue("@postava", Convert.ToInt32(DDL_postava.SelectedValue));
        conn.Open();
        try
        {
            insert.ExecuteNonQuery();

        }
        catch (Exception) { }
        finally
        {
            Response.Redirect(Request.RawUrl);
            conn.Close();
        }
    }

    protected void Button_update_Click(object sender, EventArgs e)
    { SqlCommand update = new SqlCommand("UPDATE  [hraci] " +
        "set jmeno=@jmeno, level=@level,strenght=@strenght,dexterity=@dexterity,constitution=@constitution,inteligence=@inteligence,wisdom=@wisdom,charisma=@charisma,postava=@postava " +
        "where id=@id", conn);
        update.Parameters.AddWithValue("@id", DDL_id.SelectedValue);
        update.Parameters.AddWithValue("@jmeno", TextBox_jméno.Text);
        update.Parameters.AddWithValue("@level", Convert.ToInt32(tb_level.Text));
        update.Parameters.AddWithValue("@strenght", Convert.ToInt32(tb_str.Text));
        update.Parameters.AddWithValue("@dexterity", Convert.ToInt32(tb_dex.Text));
        update.Parameters.AddWithValue("@constitution", Convert.ToInt32(tb_con.Text));
        update.Parameters.AddWithValue("@inteligence", Convert.ToInt32(tb_int.Text));
        update.Parameters.AddWithValue("@wisdom", Convert.ToInt32(tb_wis.Text));
        update.Parameters.AddWithValue("@charisma", Convert.ToInt32(tb_cha.Text));
        update.Parameters.AddWithValue("@postava", Convert.ToInt32(DDL_postava.SelectedValue));

        conn.Open();
        update.ExecuteNonQuery();
        try
        {


        }
        catch (Exception ex)
        {

        }
        finally
        {
            conn.Close();
            Response.Redirect(Request.RawUrl);
        }
    }

    protected void Button_delete_Click(object sender, EventArgs e)
    {
        SqlCommand del = new SqlCommand("DELETE from hraci where id = @id", conn);
        del.Parameters.AddWithValue("@id", DDL_id.SelectedValue);
        conn.Open();
        try
        {
            del.ExecuteNonQuery();

        }
        catch (Exception) { }
        finally
        {
            conn.Close();
            Response.Redirect(Request.RawUrl);
        }

    }
    protected void DDL_id_SelectedIndexChanged(object sender, EventArgs e)
    {
        conn.Open();
        SqlCommand vypln = new SqlCommand("select * from hraci where id=@id", conn);
        vypln.Parameters.AddWithValue("@id",Convert.ToInt32(DDL_id.SelectedValue));
        vypln.CommandType = System.Data.CommandType.Text;
        vypln.Connection = conn;
        try { 
        SqlDataReader reader = vypln.ExecuteReader();
        while (reader.Read())
        {
            TextBox_jméno.Text = reader["jmeno"].ToString();
            tb_level.Text = reader["level"].ToString();
            tb_str.Text = reader["strenght"].ToString();
            tb_dex.Text = reader["dexterity"].ToString();
            tb_con.Text = reader["constitution"].ToString();
            tb_int.Text = reader["inteligence"].ToString();
            tb_wis.Text = reader["wisdom"].ToString();
            tb_cha.Text = reader["charisma"].ToString();
            DDL_postava.SelectedValue = reader["postava"].ToString();
        }
        }
        catch { }
        finally
        {
            conn.Close();
        }
    }
}
