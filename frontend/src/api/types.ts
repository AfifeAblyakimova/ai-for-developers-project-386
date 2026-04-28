export type EventType = {
  id: string
  name: string
  description?: string
  durationMinutes: number
}

export type Booking = {
  id: string
  eventTypeId: string
  start: string
  end: string
  guestName: string
  guestEmail?: string
  createdAt: string
}

export type Slot = {
  start: string
  end: string
  isAvailable: boolean
}

export type CreateEventTypeRequest = {
  name: string
  description?: string
  durationMinutes: number
}

export type UpdateEventTypeRequest = Partial<CreateEventTypeRequest>

export type CreateBookingRequest = {
  eventTypeId: string
  start: string
  guestName: string
  guestEmail?: string
}
