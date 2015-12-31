ActiveAdmin.register User do
  controller do
    def permitted_params
      params.permit(:user => [:user, :email, :password, :password_confirmation, :first_name,
        :surname, :title, :role_id, :username])
        # params.permit! # allow all parameters
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :first_name
      f.input :surname
      f.input :title
      f.input :username
      f.input :role_id, as: :select, collection: Hash[Role.all.map { |b| [b.name, b.id] }], input_html: { style: 'width:25%' }
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def update
      @user = User.find(params[:id])
      if params[:user][:password].blank?
        @user.update_without_password(permitted_params[:user])
      else
        @user.update_attributes(permitted_params[:user])
      end
      if @user.errors.blank?
        redirect_to admin_users_path, :notice => "User updated successfully."
      else
        render :edit
      end
    end
  end
end
