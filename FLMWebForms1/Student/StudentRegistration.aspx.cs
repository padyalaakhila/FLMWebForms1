using FLMWebForms1.Data.Dao;
using FLMWebForms1.Data.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLMWebForms1.Student
{
    public partial class StudentRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                CourseDao courseDao = new CourseDao();
                DataTable courseData = courseDao.GetAllRecords();
                DdlCourse.DataSource = courseData;
                DdlCourse.DataTextField = "coursename";
                DdlCourse.DataValueField = "id";
                DdlCourse.DataBind();
               
                DdlCourse.Items.Insert(0, new ListItem("Select Course", "0"));

                DdlCourse.SelectedIndex = 0;
                DdlState.SelectedIndex = 0;
                ImgStudPhoto.Visible = false;
            }
        }

        protected void DdlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DdlState.SelectedIndex > 0)
            {
                DdlCity.Items.Clear();
                ListItem selectItem = new ListItem("Select a City", "Select a City");
                DdlCity.Items.Add(selectItem);

                if (DdlState.SelectedIndex == 1)
                {
                    DdlCity.Items.Add(new ListItem("Guntur", "Guntur"));
                    DdlCity.Items.Add(new ListItem("Vizag", "Vizag"));
                    DdlCity.Items.Add(new ListItem("Vijayawada", "Vijayawada"));
                }
                else if (DdlState.SelectedIndex == 2)
                {
                    DdlCity.Items.Add(new ListItem("Hyderabad", "Hyderabad"));
                    DdlCity.Items.Add(new ListItem("Warangal", "Warangal"));
                    DdlCity.Items.Add(new ListItem("Nalgonda", "Nalgonda"));
                }
                else if (DdlState.SelectedIndex == 3)
                {
                    DdlCity.Items.Add(new ListItem("Bengaluru", "Bengaluru"));
                    DdlCity.Items.Add(new ListItem("Mysore", "Mysore"));
                    DdlCity.Items.Add(new ListItem("Mangalore", "Mangalore"));
                }
                else if (DdlState.SelectedIndex == 4)
                {
                    DdlCity.Items.Add(new ListItem("Chennai", "Chennai"));
                    DdlCity.Items.Add(new ListItem("Coimbattor", "Coimbattor"));
                    DdlCity.Items.Add(new ListItem("Madhurai", "Madhurai"));
                }
                else if (DdlState.SelectedIndex == 5)
                {
                    DdlCity.Items.Add(new ListItem("Trivendram", "Trivendram"));
                    DdlCity.Items.Add(new ListItem("Kochi", "Kochi"));
                    DdlCity.Items.Add(new ListItem("Wayanad", "Wayanad"));
                }
                else if (DdlState.SelectedIndex == 6)
                {
                    DdlCity.Items.Add(new ListItem("Mumbai", "Mumbai"));
                    DdlCity.Items.Add(new ListItem("Pune", "Pune"));
                    DdlCity.Items.Add(new ListItem("Nagpur", "Nagpur"));
                }

                DdlCity.Items.Add(new ListItem("", ""));
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            CalDob.Visible = true;
        }

        protected void CalDob_SelectionChanged(object sender, EventArgs e)
        {
            CalDob.Visible = false;
            LblDob.Visible = true;
            LblDob.Text = CalDob.SelectedDate.ToShortDateString();
        }

        
        protected void BtnUpload_Click(object sender, EventArgs e)
        {
            if (!(FileStudPhoto.PostedFile.FileName.ToLower().EndsWith(".png") ||
                FileStudPhoto.PostedFile.FileName.ToLower().EndsWith(".jpg")))
            {
                LblError.Text = "Please upload only PNG/JPG files.";
                return;
            }
            else
            {
                string path = Server.MapPath("./uploads/") + FileStudPhoto.PostedFile.FileName;
                FileStudPhoto.SaveAs(path);
                ImgStudPhoto.ImageUrl = path;
                ImgStudPhoto.Visible = true;
            }
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            /*
            string photopath = "";
            if (FileStudPhoto.PostedFile != null && !(FileStudPhoto.PostedFile.FileName.ToLower().EndsWith("png") || FileStudPhoto.PostedFile.FileName.ToLower().EndsWith("jpg")))
            {
                LblError.Text = "Please upload Images only :: type JPG/PNG";
                return;
            }
            else
            {
                photopath = Server.MapPath("./uploads/") + FileStudPhoto.PostedFile.FileName;
                FileStudPhoto.SaveAs(photopath);

            }*/ 



            if (DdlCourse.SelectedIndex == 0)
            {
                LblError.Text = "Please select a course";
                return;
            }
 

            StudentMaster student = new StudentMaster();
            student.StudName = TxtStudName.Text;
            student.EmailId = TxtEmail.Text;
            student.Password = TxtPassword.Text;
            student.Gender = RbtMale.Checked;
            student.State = DdlState.SelectedValue;
            student.City = DdlCity.SelectedValue;
            student.Mobile = TxtMobile.Text;
            student.Address = TxtAddress.Text;
            student.Dob = CalDob.SelectedDate;
            student.Photo = Server.MapPath("./uploads/") + FileStudPhoto.PostedFile.FileName;
            student.FkCourseId = int.Parse(DdlCourse.SelectedValue);

            StudentMasterDao dao = new StudentMasterDao();
            //dao.PerformInsertUpdateDelete(student, "save");
            int rowsAffected = dao.PerformInsertUpdateDelete(student, "save");
            if (rowsAffected > 0)
            {
                Response.Redirect("StudentLogin.aspx");
            }
            else
            {
                LblError.Text = "Error occurred while saving student data. Please Try Again.!";
            }
        }

       
    }
}