{$forms.groupForm.open}
<div class="form-row">
  <div class="form-group col-md-6">
    <label>{$i18n.label.group_name}</label>
    {$forms.groupForm.group_name.control}
  </div>
  <div class="form-group col-md-2">
    <label>{$i18n.label.currency}</label>
    {$forms.groupForm.currency.control}
  </div>
  <div class="form-group col-md-4">
    <label>{$i18n.label.language}</label>
    {$forms.groupForm.lang.control}
  </div>
</div>
<div class="form-row">
  <div class="form-group col-md-6">
    <label>{$i18n.label.manager_name} (*)</label>
    {$forms.groupForm.manager_name.control}
  </div>
  <div class="form-group col-md-6">
    <label>{$i18n.label.manager_login} (*)</label>
    {$forms.groupForm.manager_login.control}
  </div>
</div>
<div class="form-row">
  <div class="form-group col-md-6">
    <label>{$i18n.label.password} (*)</label>
    {$forms.groupForm.password1.control}
  </div>
  <div class="form-group col-md-6">
    <label>{$i18n.label.confirm_password} (*)</label>
    {$forms.groupForm.password2.control}
  </div>
</div>
<div class="form-group">
  <label>{$i18n.label.email}</label>
  {$forms.groupForm.manager_email.control}
</div>
<div>
  {$i18n.label.required_fields}
</div>
<div>
  {$forms.groupForm.btn_submit.control}
</div>
{$forms.groupForm.close}
