using System;
using System.Data;
using System.Drawing;
using System.Net;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace jeweler
{
    public partial class Form1 : Form
    {
        string connectionString = "Server=127.0.0.1;Database=Ювелир;User Id=root;Password= ;Charset=utf8";

        public Form1()
        {
            InitializeComponent();
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();
           
                string query = "SELECT * FROM product";

                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                           
                            Image productImage = DownloadImageFromUrl(reader["product_photo"].ToString());
                          
                            dataGridView1.Rows.Add(
                                reader["product_name"],
                                reader["product_quantity"],
                                reader["product_price"],
                                reader["product_description"],
                                productImage 
                            );
                        }
                    }
                }
                connection.Close();
            }
        }

        private Image DownloadImageFromUrl(string imageUrl)
        {
            try
            {
                using (WebClient webClient = new WebClient())
                {
                    byte[] data = webClient.DownloadData(imageUrl);
                    using (System.IO.MemoryStream memoryStream = new System.IO.MemoryStream(data))
                    {
                        return Image.FromStream(memoryStream);
                    }
                }
            }
            catch (Exception ex)
            {
                // Обработка ошибок при загрузке изображения
                Console.WriteLine("Ошибка загрузки изображения: " + ex.Message);
                return null;
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
     
    }
}
