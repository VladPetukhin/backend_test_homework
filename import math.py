
class Training:
    """Класс Training используется в качестве родительского класса."""

    def __init__(self, action: int, duration: float, weight: float) -> None:
        self.LEN_STEP = 0.65
        self.action = action * self.LEN_STEP
        self.duration = duration
        self.weight = weight
        self.M_IN_KM = 1000

    def get_distance(self) -> float:
        """Метод класса для определения расстояния"""
        distance: float = self.action / self.M_IN_KM
        return distance

    def get_mean_speed(self) -> float:
        """Метод класса для определения средней скорости"""
        mean_speed: float = Training.get_distance(self) / self.duration
        return mean_speed

    def get_spent_calories(self):
        """Подсчет колориев. Переопределяется в дочерних классах"""
        pass

    def show_training_info(self):
        """Метод класса для вывода информации о тренировке"""
        return InfoMessage(self.__class__.__name__,
                           self.duration,
                           self.get_distance(),
                           self.get_mean_speed(),
                           self.get_spent_calories())


class Swimming(Training):
    """Дочерний класс к Training. Расчет показателей тренировки Swimming"""

    def __init__(self,
                 action,
                 duration,
                 weight,
                 length_pool: float,
                 count_pool: int) -> None:
        super().__init__(action, duration, weight)
        self.LEN_STEP = 1.38
        self.length_pool = length_pool
        self.count_pool = count_pool
        self.action = action * self.LEN_STEP

    def get_mean_speed(self) -> float:
        """Метод определения средней скорости. переопределяется в классе"""
        mean_spead: float = (
                             self.length_pool * self.count_pool
                             / self.M_IN_KM / self.duration)
        return mean_spead

    def get_spent_calories(self) -> float:
        """Метод определения потраченных калорий. переопределяется в классе"""
        spent_calories: float = (
                                 (Swimming.get_mean_speed(self) + 1.1)
                                 * 2 * self.weight)
        return spent_calories


class Running(Training):
    """Дочерний класс к Training."""

    def get_spent_calories(self) -> float:
        """Метод класса для определения потраченных калорий."""
        coeff_calorie_1: int = 18
        coeff_calorie_2: int = 20
        duration_minutes: float = self.duration * 60
        spent_calories: float = (
                                 (coeff_calorie_1
                                  * Training.get_mean_speed(self)
                                  - coeff_calorie_2)
                                 * self.weight / self.M_IN_KM
                                 * duration_minutes)
        return spent_calories


class SportsWalking(Training):
    """Дочерний класс Training. Расчет показателей тренировки SportsWalking"""

    def __init__(self, action, duration, weight, height: float):
        super().__init__(action, duration, weight)
        self.height = height

    def get_spent_calories(self) -> float:
        """Метод определения потраченных калорий.переопределяется в классе"""
        duration_minutes: float = self.duration * 60
        ratio_1: float = 0.035
        ratio_2: float = 0.029
        spent_calories: float = (
                                 (ratio_1 * self.weight
                                  + (Training.get_mean_speed(self) ** 2
                                  // self.height) * ratio_2
                                  * self.weight) * duration_minutes)
        return spent_calories


class InfoMessage:
    """Класс для сообщения о результатах тренировки"""

    def __init__(self,
                 training_type: Training,
                 duration: float,
                 distance: float,
                 speed: float,
                 calories: float):
        self.training_type = training_type
        self.duration = round(duration, 3)
        self.distance = round(distance, 3)
        self.speed = round(speed, 3)
        self.calories = round(calories, 3)

    def get_message(self) -> str:
        """Метод класса для сообщения с результатами тренировки"""
        return (f'Тип тренировки: {self.training_type}; '
                f'Длительность: {self.duration} ч.; '
                f'Дистанция: {self.distance} км; '
                f'Ср. скорость: {self.speed} км/ч; '
                f'Потрачено ккал: {self.calories}.')

def read_package(new_workout: str, readings: list) -> None:
    """Проверяет данные, определяет класс и создает соответствующий обьект"""
    available_activities: dict = {'SWM': Swimming,
                                  'RUN': Running,
                                  'WLK': SportsWalking}
    if new_workout in available_activities:
        new_training: None = available_activities[new_workout](*readings)
    return new_training


def main(new_training: Training):
    """Фукция принимает на вход обьект и выводит сообщение с результатами"""
    info = new_training.show_training_info()
    print(info.get_message())


if __name__ == '__main__':
    packages = [
        ('SWM', [720, 1, 80, 25, 40]),
        ('RUN', [15000, 1, 75]),
        ('WLK', [9000, 1, 75, 180]),
    ]

    for workout_type, data in packages:
        training = read_package(workout_type, data)
        main(training)
