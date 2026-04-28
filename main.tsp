import "@typespec/http";
import "@typespec/openapi3";

using Http;

@service(#{
  title: "Calendar Booking API"
})
namespace Calendar;

@minValue(1)
@maxValue(1440)
scalar DurationMinutes extends int32;

@example(#{
  id: "meeting-15",
  name: "Встреча на 15 минут",
  description: "Короткая встреча для быстрого созвона.",
  durationMinutes: 15
})
model EventType {
  id: string;
  name: string;
  description?: string;
  durationMinutes: DurationMinutes;
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
  durationMinutes: DurationMinutes;
}

model UpdateEventTypeRequest {
  name?: string;
  description?: string;
  durationMinutes?: DurationMinutes;
}

model CreateBookingRequest {
  eventTypeId: string;
  start: utcDateTime;
  guestName: string;
  guestEmail?: string;
}

@route("/event-types")
interface EventTypesApi {
  @opExample(#{
    returnType: #[
      #{
        id: "meeting-15",
        name: "Встреча на 15 минут",
        description: "Короткая встреча для быстрого созвона.",
        durationMinutes: 15
      },
      #{
        id: "meeting-30",
        name: "Встреча на 30 минут",
        description: "Стандартная встреча для обсуждения задачи.",
        durationMinutes: 30
      }
    ]
  })
  @get
  list(): EventType[];

  @post
  create(@body body: CreateEventTypeRequest): EventType;

  @route("/{id}")
  @get
  get(@path id: string): EventType;

  @route("/{id}")
  @patch
  update(@path id: string, @body body: UpdateEventTypeRequest): EventType;

  @route("/{id}")
  @delete
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
