module CategoriesHelper
  def google_chart (items = [], title = '')
    chart = {}
    chart[:size]   = '&amp;chs='        # 200x300
    chart[:data]   = '&amp;chd=t:'      # 0.0,1.1|2,3
    chart[:type]   = '&amp;cht='        # bvg
    chart[:axes]   = '&amp;chxt='       # y,x,x,r,t
    chart[:labels] = '&amp;chxl='       # 0:||Votes|2:||Season|
    chart[:color]  = '&amp;chco=55AA55'
    chart_array = []

    case items.first.fields
    when /\d+x\d+/ # charting TV show episodes
      for item in items
        season = item.fields.to_i - 1
        chart_array[season] = 0 unless chart_array[season]
        chart_array[season] += item.net_votes
      end
      chart_array.map! {|v| v < 0 ? 0 : v}
      max = [chart_array.max, 1].max
      chart_array.map! {|v| (v.to_f / max * 100).to_i}

      chart[:size]   += (chart_array.size * 50).to_s + 'x200'
      chart[:data]   += chart_array.join(',')
      chart[:type]   += 'bvg'
      chart[:axes]   += 'y,x,x'
      chart[:labels] += '0:||Net+Votes|1:|' + (1..(chart_array.size)).to_a.join('|') + '|2:||Season|'
    else
      return
    end

    url = 'http://chart.apis.google.com/chart?chtt=' + title.sub(/ /,'+')
    chart.each_value {|v| url += v}
    '<img src="' + url + '" />'
  end
end
