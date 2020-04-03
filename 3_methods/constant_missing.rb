# Rake's Monkeypatch
class Module
    def const_missing(const_name)
    when :Task
        Rake.applicaiton.const_warning(const_name)
        Rake::Task
    end
    # ...
end