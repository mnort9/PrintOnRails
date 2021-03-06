ActiveAdmin.register Customer do
  controller.authorize_resource :except => :index

	# Menu item
  menu :label => "Customers", :if => proc{ can?(:create, Customer) }

  scope(:all, :if => proc{ can?(:manage, :all) } ) { |customers| customers }
  scope(:mine, default: true) { |customers| customers.where(:admin_user_id => current_admin_user.id ) }

  scope_to :current_manager, :association_method => :customers

  controller do
    def current_manager
      unless can? :read, :all
        current_user
      end
    end
  end


  filter :name, label: "by Name"
  filter :admin_user, :collection => proc { AdminUser.all.map{|u| [u.full_name, u.id] } }
  filter :company, label: "by Company"
  filter :email, label: "by Email"
  filter :phone, label: "by Phone Number"

  index do
    selectable_column
    column "Name" do |customer|
      link_to customer.name, admin_customer_path(customer)
    end
    column :company
    column :email, :sortable => :email do |customer|
      link_to customer.email, "mailto:#{customer.email}"
    end
    column :phone
    if can? :destroy, Customer 
        column 'Edit' do |customer|
          link_to(image_tag('edit.png'), edit_admin_customer_path(customer))
        end
        column 'Delete' do |customer|
          link_to(image_tag('delete.png'), admin_customer_path(customer), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link")
        end
      elsif 
        column 'Edit' do |customer|
          link_to(image_tag('edit.png'), edit_admin_customer_path(customer))
        end
      end
  end
	  
	form :partial => "form"

  show :title => :name do
    panel "Order History" do
      table_for(customer.orders) do
        column("ID", :sortable => :id) {|order| link_to "##{order.id}", admin_order_path(order) }
        column("Order Name", :sortable => :name) {|order| "#{order.name}" }
        column("Due Date", :sortable => :end_date) {|order| "#{order.end_date}" }
      end
    end
    resource.addresses.each do |a|
     text_node(render :partial => "admin/addresses/show", :locals => { :address => a })
    end
    active_admin_comments
  end
  sidebar "Customer Details", :only => :show do
    attributes_table_for customer do
      row :name
      row :company
      row :email
      row :phone
      row :admin_user
      row :created_at
    end
  end
end