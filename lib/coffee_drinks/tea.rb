class Tea

    @@all = []
    @@all_sorted = []

    attr_accessor :name, :description, :flavor, :varieties

    def initialize (name, description = nil, flavor = nil, varieties = nil)
        @name = name
        @description = description
        @flavor = flavor
        @varieties = varieties
        @@all << self
    end

    def self.all
        @@all
    end

    def self.sorted_all
        self.all.sort_by {|tea| tea.name}.each {|instance| @@all_sorted << instance }
        @@all_sorted
    end

end