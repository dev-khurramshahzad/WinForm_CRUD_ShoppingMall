using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ShoppingMall
{
    public partial class Home : Form
    {
        public Home()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Categories brands = new Categories();
            brands.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Brands categories = new Brands();
            categories.ShowDialog();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Products products = new Products(); 
            products.ShowDialog();
        }
    }
}
