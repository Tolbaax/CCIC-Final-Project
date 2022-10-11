abstract class PostHandlerStates {}

class PostHandlerInitState extends PostHandlerStates {}

class ChangeProgress extends PostHandlerStates {}

class PostImagePickedSuccessState extends PostHandlerStates {}

class PostImagePickedErrorState extends PostHandlerStates {}

class UploadPostLoadingState extends PostHandlerStates {}

class UploadPostSuccessState extends PostHandlerStates {}

class UploadPostErrorState extends PostHandlerStates {}
