CREATE OR REPLACE PACKAGE phenix.use_business_pack as

procedure change_password_proc(
  p_current_user                in      varchar2,
  p_current_password            in      varchar2,
  p_new_user                    in      varchar2,
  p_new_password                in      varchar2);

procedure create_user_proc(
  p_current_user                in      varchar2,
  p_current_password            in      varchar2,
  p_new_user                    in      varchar2,
  p_new_password                in      varchar2);

end use_business_pack;
/