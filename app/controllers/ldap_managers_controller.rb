class LdapManagersController < ApplicationController
before_action :set_index, only: [:show, :edit, :update, :destroy]

  # GET /ldap_managers
  # GET /ldap_managers.json
  def index
    @directory = Index.all
    @index = Index.new
    @ldap_managers = LdapManager.all
    ldap = Net::LDAP.new	:host => "dc03.techlab.pp.ua",
                :port => 389,
                :encryption => :none,
                :base => "DC=dc,DC=techalb,DC=pp,DC=ua",
                :auth => {
                  :method => :simple,
                  :username => "directory",
                  :password => "P@ssw0rd"
                }
                filter = Net::LDAP::Filter.eq("sAMAccountName", "*")
                filter2 = Net::LDAP::Filter.eq("objectCategory", "organizationalPerson")
                joined_filter = Net::LDAP::Filter.join(filter, filter2)
                treebase = "OU=Office_Users,DC=office,DC=parallel,DC=ua"
    @ldusers = ldap.search(:base => treebase, :filter => joined_filter, :return_result => true)
  end

  def create
      @index = Index.new(index_params)
      respond_to do |format|
        if @index.save
          format.html { redirect_to request.referrer, notice: 'Учетная запись пользователя создана успешно.' }
          format.json { render :show, status: :created, location: @index }
        else
          format.html { render :new }
          format.json { render json: @index.errors, status: :unprocessable_entity }
        end
      end
    end

    def import_all
	ldap = Net::LDAP.new        :host => "dc03.techlab.pp.ua",
                :port => 389,
                :encryption => :none,
                :base => "DC=test,DC=techlab,DC=pp,DC=ua",
                :auth => {
                  :method => :simple,
                  :username => "directory",
                  :password => "P@ssw0rd"
                }
                filter = Net::LDAP::Filter.eq("sAMAccountName", "*")
                filter2 = Net::LDAP::Filter.eq("objectCategory", "organizationalPerson")
                joined_filter = Net::LDAP::Filter.join(filter, filter2)
                treebase = "OU=test,DC=techlab,DC=pp,DC=ua"
    @ldusers = ldap.search(:base => treebase, :filter => joined_filter, :return_result => true)
      @ldusers.each do |ldap|
                  pluton_worker = Index.new
                  pluton_worker.name = ldapadap(ldap, :name)
                  pluton_worker.givenName = ldapadap(ldap, :givenName)
                  pluton_worker.sAMAccountName = ldapadap(ldap, :sAMAccountName)
                  pluton_worker.sn = ldapadap(ldap, :sn)
                  pluton_worker.displayName = ldapadap(ldap, :displayName)
                  pluton_worker.description = ldapadap(ldap, :description)
                  pluton_worker.physicalDeliveryOfficeName = ldapadap(ldap, :physicalDeliveryOfficeName)
                  pluton_worker.telephoneNumber = ldapadap(ldap, :telephoneNumber)
                  pluton_worker.mail = ldapadap(ldap, :mail)
                  pluton_worker.title = ldapadap(ldap, :title)
                  pluton_worker.department = ldapadap(ldap, :department)
                  pluton_worker.company = ldapadap(ldap, :company)
                  pluton_worker.ipphone = ldapadap(ldap, :ipphone)
                  pluton_worker.mobile = ldapadap(ldap, :mobile)
                  pluton_worker.company = ldapadap(ldap, :company)
                  pluton_worker.homephone = ldapadap(ldap, :homephone)
                  pluton_worker.cloudUser = false
                  pluton_worker.usbUser = false
                  pluton_worker.userit = false
                  pluton_worker.registered = true
                  pluton_worker.photo = '/public/images/avatar/'+ldapadap(ldap, :sAMAccountName)+'.jpg'
                  pluton_worker.save
                end
      redirect_to request.referrer, notice: "Импорт завершен."
    end

    def import_photo
	ldap = Net::LDAP.new        :host => "dc03.techlab.pp.ua",
                :port => 389,
                :encryption => :none,
                :base => "DC=office,DC=techlab,DC=pp,DC=ua",
                :auth => {
                  :method => :simple,
                  :username => "directory",
                  :password => ""
                }
                filter = Net::LDAP::Filter.eq("sAMAccountName", "*")
                filter2 = Net::LDAP::Filter.eq("objectCategory", "organizationalPerson")
                joined_filter = Net::LDAP::Filter.join(filter, filter2)
                treebase = "OU=Office_Users,DC=office,DC=parallel,DC=ua"
    @ldusers = ldap.search(:base => treebase, :filter => joined_filter, :return_result => true)
      @ldusers.each do |data|
        [:thumbnailphoto, :jpegphoto, :photo].each do |photo_key|
          if data.attribute_names.include?(photo_key)
            photo_save(ldapadap(data, :sAMAccountName),data.thumbnailPhoto[0])
          end
        end
      end
      redirect_to request.referrer, notice: 'Фотографии загружены'
    end
    private
    # Use callbacks to share common setup or constraints between actions.
    def ldapConnector
      ldap = Net::LDAP.new        :host => "dc03.techalab.pp.ua",
                :port => 389,
                :encryption => :none,
                :base => "DC=test,DC=techlab,DC=pp,DC=ua",
                :auth => {
                  :method => :simple,
                  :username => "directory",
                  :password => ""
                }
                filter = Net::LDAP::Filter.eq("sAMAccountName", "*")
                filter2 = Net::LDAP::Filter.eq("objectCategory", "organizationalPerson")
                joined_filter = Net::LDAP::Filter.join(filter, filter2)
                treebase = "OU=Office_Users,DC=office,DC=parallel,DC=ua"
    @ldusers = ldap.search(:base => treebase, :filter => joined_filter, :return_result => true)
      return ldusers
    end

    def set_index
      @index = Index.find(params[:id])
    end

    def photo_save(name,data)
        File.open('public/images/avatars/'+name+'.jpg', 'wb') { |f| f.write(data) }
    end

    def ldapadap(data,key)
      begin
        data[key].to_s.delete('"[]"')
      rescue
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def index_params
      params.require(:name).permit(:name, :givenName, :sn, :sAMAccountName, :displayName, :description, :physicalDeliveryOfficeName, :telephoneNumber, :mail, :title, :department, :company, :ipphone, :mobile, :homephone, :photo, :cloudUser, :usbUser, :userit)
    end
end
