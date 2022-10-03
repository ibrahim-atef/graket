abstract class CourseStates {}

class CourseInitializedStates extends CourseStates {}



///Enroll
class EnrollCourseLoadingStates extends CourseStates {}

class EnrollCourseSuccessStates extends CourseStates {}

class EnrollCourseErrorStates extends CourseStates {}


class GetMyEnrolledCoursesLoadingState extends CourseStates {}

class GetMyEnrolledCoursesSuccessState extends CourseStates {}

class GetMyEnrolledCoursesErrorState extends CourseStates {}
///fav
class AddToFavLoadingStates extends CourseStates {}

class AddToFavSuccessStates extends CourseStates {}

class AddToFavErrorStates extends CourseStates {}


class GetMyFavCoursesLoadingState extends CourseStates {}

class GetMyFavCoursesSuccessState extends CourseStates {}

class GetMyFavCoursesErrorState extends CourseStates {}

class RemoveFromFavLoadingState extends CourseStates {}

class RemoveFromFavSuccessState extends CourseStates {}

class RemoveFromFavErrorState extends CourseStates {}



