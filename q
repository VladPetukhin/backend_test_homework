[33mcommit c34c77c68def8129c905e7f8d8bf0bdaa3a4f3ad[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m, [m[1;31morigin/master[m[33m, [m[1;31morigin/HEAD[m[33m)[m
Author: VladPetukhin <104086673+VladPetukhin@users.noreply.github.com>
Date:   Thu Apr 21 14:48:41 2022 +0300

    final version with the dataclass

[1mdiff --git a/.vscode/settings.json b/.vscode/settings.json[m
[1mnew file mode 100644[m
[1mindex 0000000..1128312[m
[1m--- /dev/null[m
[1m+++ b/.vscode/settings.json[m
[36m@@ -0,0 +1,6 @@[m
[32m+[m[32m{[m
[32m+[m[32m    "python.linting.flake8Enabled": false,[m
[32m+[m[32m    "python.linting.enabled": true,[m
[32m+[m[32m    "python.linting.mypyEnabled": false,[m
[32m+[m[32m    "python.linting.pycodestyleEnabled": true[m
[32m+[m[32m}[m
\ No newline at end of file[m
[1mdiff --git a/__pycache__/program.cpython-310.pyc b/__pycache__/program.cpython-310.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..538d504[m
Binary files /dev/null and b/__pycache__/program.cpython-310.pyc differ
[1mdiff --git a/__pycache__/test_program.cpython-310-pytest-7.1.1.pyc b/__pycache__/test_program.cpython-310-pytest-7.1.1.pyc[m
[1mnew file mode 100644[m
[1mindex 0000000..da2896f[m
Binary files /dev/null and b/__pycache__/test_program.cpython-310-pytest-7.1.1.pyc differ
[1mdiff --git a/gitignore.txt b/gitignore.txt[m
[1mnew file mode 100644[m
[1mindex 0000000..43ce488[m
[1m--- /dev/null[m
[1m+++ b/gitignore.txt[m
[36m@@ -0,0 +1,3 @@[m
[32m+[m[32mREADME.md[m
[32m+[m[32madded a new line of code[m
[32m+[m[32mand another one1[m
\ No newline at end of file[m
[1mdiff --git a/hw_python_oop b/hw_python_oop[m
[1mnew file mode 160000[m
[1mindex 0000000..928d518[m
[1m--- /dev/null[m
[1m+++ b/hw_python_oop[m
[36m@@ -0,0 +1 @@[m
[32m+[m[32mSubproject commit 928d518a0fdfa23993e34de8f3d5c8792e61f6ee[m
[1mdiff --git a/import math.py b/import math.py[m
[1mnew file mode 100644[m
[1mindex 0000000..56b352c[m
[1m--- /dev/null[m
[1m+++ b/import math.py[m	
[36m@@ -0,0 +1,150 @@[m
[32m+[m
[32m+[m[32mclass Training:[m
[32m+[m[32m    """Класс Training используется в качестве родительского класса."""[m
[32m+[m
[32m+[m[32m    def __init__(self, action: int, duration: float, weight: float) -> None:[m
[32m+[m[32m        self.LEN_STEP = 0.65[m
[32m+[m[32m        self.action = action * self.LEN_STEP[m
[32m+[m[32m        self.duration = duration[m
[32m+[m[32m        self.weight = weight[m
[32m+[m[32m        self.M_IN_KM = 1000[m
[32m+[m
[32m+[m[32m    def get_distance(self) -> float:[m
[32m+[m[32m        """Метод класса для определения расстояния"""[m
[32m+[m[32m        distance: float = self.action / self.M_IN_KM[m
[32m+[m[32m        return distance[m
[32m+[m
[32m+[m[32m    def get_mean_speed(self) -> float:[m
[32m+[m[32m        """Метод класса для определения средней скорости"""[m
[32m+[m[32m        mean_speed: float = Training.get_distance(self) / self.duration[m
[32m+[m[32m        return mean_speed[m
[32m+[m
[32m+[m[32m    def get_spent_calories(self):[m
[32m+[m[32m        """Подсчет колориев. Переопределяется в дочерних классах"""[m
[32m+[m[32m        pass[m
[32m+[m
[32m+[m[32m    def show_training_info(self):[m
[32m+[m[32m        """Метод класса для вывода информации о тренировке"""[m
[32m+[m[32m        return InfoMessage(self.__class__.__name__,[m
[32m+[m[32m                           self.duration,[m
[32m+[m[32m                           self.get_distance(),[m
[32m+[m[32m                           self.get_mean_speed(),[m
[32m+[m[32m                           self.get_spent_calories())[m
[32m+[m
[32m+[m
[32m+[m[32mclass Swimming(Training):[m
[32m+[m[32m    """Дочерний класс к Training. Расчет показателей тренировки Swimming"""[m
[32m+[m
[32m+[m[32m    def __init__(self,[m
[32m+[m[32m                 action,[m
[32m+[m[32m                 duration,[m
[32m+[m[32m                 weight,[m
[32m+[m[32m                 length_pool: float,[m
[32m+[m[32m                 count_pool: int) -> None:[m
[32m+[m[32m        super().__init__(action, duration, weight)[m
[32m+[m[32m        self.LEN_STEP = 1.38[m
[32m+[m[32m        self.length_pool = length_pool[m
[32m+[m[32m        self.count_pool = count_pool[m
[32m+[m[32m        self.action = action * self.LEN_STEP[m
[32m+[m
[32m+[m[32m    def get_mean_speed(self) -> float:[m
[32m+[m[32m        """Метод определения средней скорости. переопределяется в классе"""[m
[32m+[m[32m        mean_spead: float = ([m
[32m+[m[32m                             self.length_pool * self.count_pool[m
[32m+[m[32m                             / self.M_IN_KM / self.duration)[m
[32m+[m[32m        return mean_spead[m
[32m+[m
[32m+[m[32m    def get_spent_calories(self) -> float:[m
[32m+[m[32m        """Метод определения потраченных калорий. переопределяется в классе"""[m
[32m+[m[32m        spent_calories: float = ([m
[32m+[m[32m                                 (Swimming.get_mean_speed(self) + 1.1)[m
[32m+[m[32m                                 * 2 * self.weight)[m
[32m+[m[32m        return spent_calories[m
[32m+[m
[32m+[m
[32m+[m[32mclass Running(Training):[m
[32m+[m[32m    """Дочерний класс к Training."""[m
[32m+[m
[32m+[m[32m    def get_spent_calories(self) -> float:[m
[32m+[m[32m        """Метод класса для определения потраченных калорий."""[m
[32m+[m[32m        coeff_calorie_1: int = 18[m
[32m+[m[32m        coeff_calorie_2: int = 20[m
[32m+[m[32m        duration_minutes: float = self.duration * 60[m
[32m+[m[32m        spent_calories: float = ([m
[32m+[m[32m                                 (coeff_calorie_1[m
[32m+[m[32m                                  * Training.get_mean_speed(self)[m
[32m+[m[32m                                  - coeff_calorie_2)[m
[32m+[m[32m                                 * self.weight / self.M_IN_KM[m
[32m+[m[32m                                 * duration_minutes)[m
[32m+[m[32m        return spent_calories[m
[32m+[m
[32m+[m
[32m+[m[32mclass SportsWalking(Training):[m
[32m+[m[32m    """Дочерний класс Training. Расчет показателей тренировки SportsWalking"""[m
[32m+[m
[32m+[m[32m    def __init__(self, action, duration, weight, height: float):[m
[32m+[m[32m        super().__init__(action, duration, weight)[m
[32m+[m[32m        self.height = height[m
[32m+[m
[32m+[m[32m    def get_spent_calories(self) -> float:[m
[32m+[m[32m        """Метод определения потраченных калорий.переопределяется в классе"""[m
[32m+[m[32m        duration_minutes: float = self.duration * 60[m
[32m+[m[32m        ratio_1: float = 0.035[m
[32m+[m[32m        ratio_2: float = 0.029[m
[32m+[m[32m        spent_calories: float = ([m
[32m+[m[32m                                 (ratio_1 * self.weight[m
[32m+[m[32m                                  + (Training.get_mean_speed(self) ** 2[m
[32m+[m[32m                                  // self.height) * ratio_2[m
[32m+[m[32m                                  * self.weight) * duration_minutes)[m
[32m+[m[32m        return spent_calories[m
[32m+[m
[32m+[m
[32m+[m[32mclass InfoMessage:[m
[32m+[m[32m    """Класс для сообщения о результатах тренировки"""[m
[32m+[m
[32m+[m[32m    def __init__(self,[m
[32m+[m[32m                 training_type: Training,[m
[32m+[m[32m                 duration: float,[m
[32m+[m[32m       