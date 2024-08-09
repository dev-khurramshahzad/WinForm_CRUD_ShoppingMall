using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ShoppingMall
{
    public partial class Categories : Form
    {
        SqlConnection con = new SqlConnection("Data Source=KHURRAM-LAPTOP;Database=OnlineShoppingMall;Integrated Security=true");

        public Categories()
        {
            InitializeComponent();
            LoadData();
        }

        void LoadData()
        {
            SqlCommand cmd = new SqlCommand("Select * from Categories", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Categories VALUES('"+txtName.Text+"','"+txtDetail.Text+"')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            LoadData();
            MessageBox.Show("Category Added Successfully", "Message");
            
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Categories WHERE CategoryId = '"+txtID.Text+"'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            LoadData();
            MessageBox.Show("Category Delete Successfully", "Message");
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select * from Categories WHERE CategoryId = '"+txtID.Text+"'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count < 1)
            {
                MessageBox.Show("Category with this not exist", "Message");
                return;
            }

            txtName.Text = dt.Rows[0][1].ToString();
            txtDetail.Text = dt.Rows[0][2].ToString();

           btnEdit.Visible = false;
            btnUpdate.Visible = true;
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Categories SET CategoryName = '" + txtName.Text + "',Description = '" + txtDetail.Text + "'  WHERE CategoryId = '"+txtID.Text+"'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            LoadData();
            MessageBox.Show("Category Updated Successfully", "Message");
        }
    }
}
