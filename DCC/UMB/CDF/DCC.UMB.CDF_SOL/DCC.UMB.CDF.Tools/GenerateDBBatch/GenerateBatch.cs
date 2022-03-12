using System;
using System.IO;
using System.Text;
using System.Windows.Forms;

namespace DCC.UMB.CDF.Tools.GenerateDBBatch
{
    public partial class GenerateBatch : Form
    {
        public string RootPath { get; set; }
        OpenFileDialog openFileDialog1 = new OpenFileDialog();

        public GenerateBatch()
        {
            InitializeComponent();
            if (!string.IsNullOrEmpty(DCC.UMB.CDF.Tools.Properties.Settings.Default.PDP))
            {
                openFileDialog1.InitialDirectory = Properties.Settings.Default.PDP;
                this.lblSelectedDirectory.Text = openFileDialog1.InitialDirectory;
            }
        }

        private void btnGenerateBatch_Click(object sender, EventArgs e)
        {
            if (this.lblSelectedDirectory.Text.Length <= 1)
            {
                return;
            }
            DCC.UMB.CDF.Tools.Properties.Settings.Default.PDP = this.lblSelectedDirectory.Text;

            DCC.UMB.CDF.Tools.Properties.Settings.Default.Save();
            string path = lblSelectedDirectory.Text;
            try
            {
                StringBuilder sb = new StringBuilder();
                this.RootPath = path;
                PrintFileNames(sb);
                this.txtResults.Text = sb.ToString();
            }
            catch (Exception ex)
            {
                // used to put break-point if needed....
                throw ex;
            }

        }

        public void PrintFileNames(StringBuilder sb)
        {
            PrintFileNames(this.RootPath, sb);
        }

        private void PrintFileNames(string path, StringBuilder sb)
        {
            DirectoryInfo di = new DirectoryInfo(path);
            if (di.Name.Contains("ToBeReviewed") ||
                di.Name.Contains("ReviewedReadyForIcrementalBuild") ||
                di.FullName.ToUpper().Contains(".SVN") ||
                di.FullName.ToUpper().EndsWith(".EXCLUDE"))
            {
                return;
            }
            FileInfo[] files = di.GetFiles();
            if (files != null)
            {
                foreach (FileInfo file in files)
                {
                    Console.WriteLine("Appending: " + file.FullName.Replace(this.RootPath, ""));
                    if (file.Name.ToUpper().Trim().EndsWith("SQL"))
                    {

                        sb.Append("PRINT 'Now executing " + file.FullName.Replace(this.RootPath, "") + "'");
                        sb.Append(System.Environment.NewLine);
                        sb.Append("GO");
                        sb.Append(System.Environment.NewLine);
                        sb.Append(File.ReadAllText(file.FullName));
                        sb.Append(System.Environment.NewLine);
                        sb.Append("GO");
                        sb.Append(System.Environment.NewLine);
                        sb.Append("PRINT 'DONE'");
                        sb.Append(System.Environment.NewLine);
                        sb.Append("------------------------------------------------------------------------------");
                        sb.Append(System.Environment.NewLine);
                        sb.Append(System.Environment.NewLine);


                    }
                    //textBox1.Text += file.Name + "\n";
                }
            }
            DirectoryInfo[] directories = di.GetDirectories();
            if (directories != null)
            {
                foreach (DirectoryInfo directory in directories)
                {
                    PrintFileNames(directory.FullName, sb);
                }
            }
        }

        private string TrimFileName(string fileName)
        {
            int indexToTrimTill = fileName.IndexOf("PITEP_RELEASE 2");
            return fileName.Substring(indexToTrimTill + 15);
        }

        private void btnBrowse_Click(object sender, EventArgs e)
        {
            openFileDialog1.FileName = "DONT_TYPE_HERE";
            openFileDialog1.Filter = "folders|*.neverseenthisfile";
            openFileDialog1.CheckFileExists = false;
            openFileDialog1.CheckPathExists = false;
            openFileDialog1.Multiselect = false;
            this.txtResults.Text = "";
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                FileInfo info = new FileInfo(openFileDialog1.FileName);
                DCC.UMB.CDF.Tools.Properties.Settings.Default.PDP = info.Directory.FullName;
                this.lblSelectedDirectory.Text = info.Directory.FullName;
            }
        }

    }
}