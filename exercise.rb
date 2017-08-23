new_hash = {
  data:
  { rooms:
    [
      { id: 1, room_number: "201", capacity: 50}, { id: 2, room_number: "301", capacity: 200 }, { id: 3, room_number: "1B", capacity: 100}
    ],
    events: [
      { id: 1, room_id: 2, start_time: 18, end_time: 20, attendees: 75 },
      { id: 2, room_id: 1, start_time: 10, end_time: 18, attendees: 25 },
      { id: 3, room_id: 2, start_time: 10, end_time: 18, attendees: 20 },
      { id: 4, room_id: 3, start_time: 18, end_time: 21, attendees: 56 },
    ]
  }
}


# Retrieve the capacity of room 201 and store it in a variable.


rooms = new_hash[:data][:rooms]
rooms.each do |room|
  @room_201 = room if room.value?("201")
end
puts "The capacity of room '#{ @room_201[:room_number] }' is #{ @room_201[:capacity] }."

# Find all the events taking place in room 201. Iterate through them and print "ok" if the number of planned attendees will fit in the room.

events = new_hash[:data][:events]
events.each do |event|
  if event[:room_id] == @room_201[:id] && event[:attendees] < @room_201[:capacity]
    puts "ok"
  end
end
