class Course
    attr_accessor :title, :schedule, :description

    @@all = []

    def initialize
        @@all << self
    end

    def Course.all
        @@all
    end
    def Course.reset_all
        @@all.clear
    end
end

