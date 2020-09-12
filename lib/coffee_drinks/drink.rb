class Drink

    @@all = []
    @@milk = []
    @@no_milk = []
    @@all_sorted = []
    @@milk_sorted = []
    @@no_milk_sorted = []

    attr_accessor :name, :milk, :description, :ratio, :cup

    def initialize (name, milk = "", description, ratio, cup)
        @name = name
        @milk = milk
        @description = description
        @ratio = ratio
        @cup = cup
        @@all << self
        @@milk << self if milk == "yes"
        @@no_milk << self if milk == "no"
    end


    def self.all
        @@all
    end

    def self.milk
        @@milk
    end

    def self.no_milk
        @@no_milk
    end

    def self.sorted_all
        self.all.sort_by {|drink| drink.name}.each {|instance| @@all_sorted << instance }
        @@all_sorted
    end
    
    def self.sorted_milk
        self.milk.sort_by {|drink| drink.name}.each {|instance| @@milk_sorted << instance }
        @@milk_sorted
    end


    def self.sorted_no_milk
        self.no_milk.sort_by {|drink| drink.name}.each {|instance| @@no_milk_sorted << instance }
        @@no_milk_sorted
    end


end


