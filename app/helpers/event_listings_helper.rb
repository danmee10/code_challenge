module EventListingsHelper

  def time_rows(time_range)
    els_tracks = EventListing.tracks.group_by do |elst|
      elst.track.split(' ')[1]
    end

    time_range.map do |t|
      obj = {time: t}
      obj[:events] = []
      els_tracks.keys.sort.each do |key|
        selected = els_tracks[key].select{|e|e.start == t || (e.start < t && e.finish >= t)}
        if selected.present?
          obj[:events] << selected
        else
          obj[:events] << [OpenStruct.new({name: ""})]
        end
      end
      obj
    end
  end

  def event_display(event)
    if event.length > 1
      event.map{|e|e.name}.join(" / ")
    else
      event.pop.name
    end
  end
end
