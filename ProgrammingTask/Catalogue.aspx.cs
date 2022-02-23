using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;

namespace ProgrammingTask
{
    public partial class Catalogue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if(txtCookieNameModal.Value == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Cookie name still blank')", true);
                return;
            }

            if (txtCookieDescModal.Value == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Cookie description still blank')", true);
                return;
            }


            DataSet dsDataChecking;
            string sqlChecking = @" SELECT *  FROM T_Catalogue where Ref_ID='" + txtRefIDModal.Value + "'";
            dsDataChecking = SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString, CommandType.Text, sqlChecking);
            if (dsDataChecking.Tables[0].Rows.Count >= 1)
            {
                string SQLInsert = @"update T_Catalogue set [Name]='" + txtCookieNameModal.Value + "', [Description]='" + txtCookieDescModal.Value + "' where Ref_ID='" + txtRefIDModal.Value + "'";
                SqlHelper.ExecuteNonQuery(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString, CommandType.Text, SQLInsert);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data has been updated successfully')", true);
            }
            else
            {
                string SQLInsert = @"declare
	                                @name nvarchar(50) = '" + txtCookieNameModal.Value + @"',
	                                @desc nvarchar(255) = '" + txtCookieDescModal.Value + @"'

                                declare
	                                @col1 varchar(100),
	                                @col2 varchar(100)

                                select @col1=left(SUBSTRING(@name,0,CHARINDEX(' ',@name)),1),
	                                   @col2=left(SUBSTRING(@name,CHARINDEX(' ',@name)+1,LEN(@name)),1) 

                                declare
	                                @var varchar(10),
	                                @id int,
	                                @currentID varchar(10)

                                select @var=case when @col1='' then  @col2+right(UPPER(@name),1)
                                 ELSE @col1+@col2
                                end


                                select top 1 
                                @id=convert(int,SUBSTRING(Ref_ID, 3,4))+1
                                from T_Catalogue 
                                where left(Ref_ID,2) = @var 
                                order by substring(Ref_ID,3,4) desc

                                select @currentID=
                                            case when @id is null then '0001'
                                                 when len(@id) = 1 then '000'+convert(varchar,@id)
			                                     when len(@id) = 2 then '00'+convert(varchar,@id)
			                                     when len(@id) = 3 then '0'+convert(varchar,@id)
			                                else convert(varchar,@id)
                                end 

                                insert into T_Catalogue (Ref_ID, [Name], [Description]) values (UPPER(@var)+@currentID, @name, @desc)";
                SqlHelper.ExecuteNonQuery(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString, CommandType.Text, SQLInsert);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data has been inserted successfully')", true);
            }
            LoadData();
        }

        void LoadData()
        {
            DataSet dsDataChecking;
            string sqlChecking = @" exec sp_loaddata '"+txtSearch.Text+"'";
            dsDataChecking = SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString, CommandType.Text, sqlChecking);
            if (dsDataChecking.Tables[0].Rows.Count >= 1)
            {
                foreach (DataRow drCheck in dsDataChecking.Tables[0].Rows)
                {
                    txtSummary.Text = drCheck["Summary"].ToString();
                }
            }
        }


        protected void btnEdit_Click(object sender, EventArgs e)
        {
            txtNameTitleModal.Text = "Edit Cookie";
            //txtRefIDModal.Text = Request.Form[txtDataRef.UniqueID]; 
            
            //txtCookieName.Text = Request.Form[txtDataName.Text];
            //txtCookieDesc.Text = txtDataDesc.Text;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalCatalogue", "$('#ModalCatalogue').modal();", true);
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            txtNameTitleModal.Text = "Add Cookie";
            txtRefIDModal.Value = "";
            txtCookieNameModal.Value = "";
            txtCookieDescModal.Value = "";


            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalCatalogue", "$('#ModalCatalogue').modal();", true);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            DataSet dsDataChecking;
            string sqlChecking = @" SELECT *  FROM T_Catalogue where Ref_ID='" + txtRefIDModal.Value + "'";
            dsDataChecking = SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString, CommandType.Text, sqlChecking);
            if (dsDataChecking.Tables[0].Rows.Count >= 1)
            {
                string SQLInsert = @"delete from T_Catalogue where Ref_ID='" + txtRefIDModal.Value + "'";
                SqlHelper.ExecuteNonQuery(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString, CommandType.Text, SQLInsert);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data has been deleted successfully')", true);
            }
            LoadData();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadData();
        }
    }
}