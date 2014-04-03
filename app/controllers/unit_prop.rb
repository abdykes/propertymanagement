module ListHelp

  class GetPropName
    attr_accessor :value
    def initialize(unit_id)
      @value = Unit.find(unit_id).property.name+' - '+Unit.find(unit_id).name
    end
  end

  class UserProp
    attr_accessor :selbox2
    def initialize(lease_id)
      @selbox2 = '<select id="user_lease_id" name="user[lease_id]" >'
      @selbox2 += '<option value="">Please Select</option>'
      Lease.all.each do |l|
        if l.id == lease_id
          @selbox2 += '<option selected="selected" value="'+l.id.to_s+'">'+GetPropName.new(l.unit_id).value+' $'+l.rent.to_s+'</option>'
        else
          @selbox2 += '<option value="'+l.id.to_s+'">'+GetPropName.new(l.unit_id).value+' $'+l.rent.to_s+'</option>'
        end
      end
      @selbox2 += '</select>'
    end
  end


  class UnitProp

    attr_accessor :selbox
    def initialize(prop_id)
      @selbox = '<select id="lease_unit_id" name="lease[unit_id]" >'
      @selbox += '<option value="">Please Select</option>'
      Unit.all.each do |u|
        if u.id == prop_id
          @selbox += '<option selected="selected" value="'+u.id.to_s+'">'+GetPropName.new(u.id).value+'</option>'
        else
          @selbox += '<option value="'+u.id.to_s+'">'+GetPropName.new(u.id).value+'</option>'
        end
      end
      @selbox += '</select>'
    end
  end



end
