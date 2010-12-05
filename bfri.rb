class NilClass

    def +(int)
        return int
    end

    def chr
        return 0.chr
    end

end

app_buffer = Array.new(1, 0)
app_pointer = 0

app = File.read(ARGV[0])
app_pos = 0

while (app_pos < app.length)

    case app[app_pos].chr
    when '<'
        app_pointer -= 1
    when '>'
        app_pointer += 1
    when '+'
        app_buffer[app_pointer] += 1
    when '-'
        app_buffer[app_pointer] -= 1
    when '.'
        print app_buffer[app_pointer].chr
    when ','
        app_buffer[app_pointer] = ARGF.read(1)
    when '['
        if (app_buffer[app_pointer] == 0 || app_buffer[app_pointer] == nil)
            matching = app_pos + 1
            inside = 0
            while (app[matching].chr != ']' || inside > 0)
                matching += 1
                if (app[matching].chr == '[')
                    inside += 1
                elsif (app[matching].chr == ']')
                    inside -= 1
                end
            end
            app_pos = matching
        end
    when ']'
        if (app_buffer[app_pointer] != 0 && app_buffer[app_pointer] != nil)
            matching = app_pos - 1
            inside = 0
            while (app[matching].chr != '[' || inside > 0)
                matching -= 1
                if (app[matching].chr == '[')
                    inside -= 1
                elsif (app[matching].chr == ']')
                    inside += 1
                end
            end
            app_pos = matching
        end
    end
    app_pos += 1

end
