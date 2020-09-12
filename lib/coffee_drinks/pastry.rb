class Pastry

    @@all = []
    @@all_sorted = []

    attr_accessor :name, :description

    def initialize (name, description = nil)
        @name = name
        @description = description
        @@all << self
    end

    def self.all
        @@all
    end

    def self.sorted_all
        self.all.sort_by {|pastry| pastry.name}.each {|instance| @@all_sorted << instance }
        @@all_sorted
    end

end

