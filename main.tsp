import "@typespec/http";
import "@typespec/openapi3";

using Http;

@service({
  title: "Calendar Booking API"
})
namespace Calendar;

model EventType {
  id: string;
  name: string;
  description?: string;
  durationMinutes: int32;
}

model Booking {
  id: string;
  eventTypeId: string;
  start: utcDateTime;
  end: utcDateTime;
  guestName: string;
  guestEmail?: string;
  createdAt: utcDateTime;
}

model Slot {
  start: utcDateTime;
  end: utcDateTime;
  isAvailable: boolean;
}

model CreateEventTypeRequest {
  name: string;
  description?: string;
  durationMinutes: int32;
}

model UpdateEventTypeRequest {
  name?: string;
  description?: string;
  durationMinutes?: int32;
}

model CreateBookingRequest {
  eventTypeId: string;
  start: utcDateTime;
  guestName: string;
  guestEmail?: string;
}

@route("/event-types")
interface EventTypesApi {
  @get
  list(): EventType[];

  @post
  create(@body body: CreateEventTypeRequest): EventType;

  @get("/{id}")
  get(@path id: string): EventType;

  @patch("/{id}")
  update(@path id: string, @body body: UpdateEventTypeRequest): EventType;

  @delete("/{id}")
  delete(@path id: string): void;
}

@route("/slots")
interface SlotsApi {
  @get
  list(
    @query eventTypeId: string,
    @query from?: utcDateTime,
    @query to?: utcDateTime
  ): Slot[];
}

@route("/bookings")
interface BookingsApi {
  @get
  list(
    @query from?: utcDateTime,
    @query to?: utcDateTime
  ): Booking[];

  @post
  create(@body body: CreateBookingRequest): Booking;
}
