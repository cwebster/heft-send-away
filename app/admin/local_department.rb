ActiveAdmin.register LocalDepartment do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :department_name
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

filter :repertoires, :collection => proc {(Repertoire.all).map{|c| [c.local_departments_id, c.id]}}

end
