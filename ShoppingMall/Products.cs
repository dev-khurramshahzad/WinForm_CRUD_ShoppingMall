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
    public partial class Products : Form
    {
        SqlConnection con = new SqlConnection("Data Source=KHURRAM-LAPTOP;Database=OnlineShoppingMall;Integrated Security=true");

        public Products()
        {
            InitializeComponent();
            LoadCats();
            LoadBrand();
            LoadData();
        }

        void LoadData()
        {
            SqlCommand cmd = new SqlCommand("Select * from Products", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;

        }

        void LoadCats()
        {
            SqlCommand cmd = new SqlCommand("Select * from Categories", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlCats.DataSource = dt;
            ddlCats.DisplayMember = dt.Columns[1].ToString();
            ddlCats.ValueMember = dt.Columns[0].ToString();
        }

        void LoadBrand()
        {
            SqlCommand cmd = new SqlCommand("Select * from Brands", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlBrands.DataSource = dt;
            ddlBrands.DisplayMember = dt.Columns[1].ToString();
            ddlBrands.ValueMember = dt.Columns[0].ToString();
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Products(ProductName,Description,CategoryId,BrandId) VALUES('" + txtName.Text + "','" + txtDetail.Text + "','" + ddlCats.SelectedValue + "','" + ddlBrands.SelectedValue + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            LoadData();
            MessageBox.Show("Product Added Successfully", "Message");
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Products WHERE ProductId = '" + txtID.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            LoadData();
            MessageBox.Show("Category Delete Successfully", "Message");
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select * from Products WHERE ProductId = '" + txtID.Text + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count < 1)
            {
                MessageBox.Show("Product with this not exist", "Message");
                return;
            }

            txtName.Text = dt.Rows[0][1].ToString();
            txtDetail.Text = dt.Rows[0][2].ToString();
            LoadCats();
            LoadBrand();

            btnEdit.Visible = false;
            btnUpdate.Visible = true;
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Products SET ProductName = '" + txtName.Text + "',Description = '" + txtDetail.Text + "',CategoryId='" + ddlCats.SelectedValue + "',BrandId='" + ddlBrands.SelectedValue + "'  WHERE ProductId = '" + txtID.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            LoadData();
            MessageBox.Show("Product Updated Successfully", "Message");
            btnEdit.Visible = true;
            btnUpdate.Visible = false;
        }

        private void btnView_Click(object sender, EventArgs e)
        {

        }
    }
}
