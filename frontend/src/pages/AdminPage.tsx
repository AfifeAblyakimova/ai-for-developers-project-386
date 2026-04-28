import { Button, Card, Container, SimpleGrid, Stack, Text, Title } from '@mantine/core'
import { Link } from 'react-router-dom'

export function AdminPage() {
  return (
    <Container size="lg" py="xl">
      <Stack gap="xl">
        <Stack gap="xs">
          <Title order={1}>Админка календаря</Title>
          <Text c="dimmed">
            Рабочее место владельца календаря: настройте типы встреч и смотрите предстоящие
            бронирования.
          </Text>
        </Stack>

        <SimpleGrid cols={{ base: 1, sm: 2 }}>
          <Card withBorder radius="lg" p="lg">
            <Stack>
              <Title order={2}>Типы событий</Title>
              <Text c="dimmed">Создание и редактирование видов встреч, доступных гостям.</Text>
              <Button component={Link} to="/admin/event-types">
                Управлять типами
              </Button>
            </Stack>
          </Card>

          <Card withBorder radius="lg" p="lg">
            <Stack>
              <Title order={2}>Предстоящие встречи</Title>
              <Text c="dimmed">Единый список всех будущих бронирований по календарю.</Text>
              <Button component={Link} to="/admin/bookings">
                Открыть встречи
              </Button>
            </Stack>
          </Card>
        </SimpleGrid>
      </Stack>
    </Container>
  )
}
