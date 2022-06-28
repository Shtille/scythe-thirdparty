project(bullet)

set(CMAKE_CXX_STANDARD 11)
set(SRC_DIRS
  src/BulletCollision/BroadphaseCollision
  src/BulletCollision/CollisionDispatch
  src/BulletCollision/CollisionShapes
  src/BulletCollision/Gimpact
  src/BulletCollision/NarrowPhaseCollision
  src/BulletDynamics/Character
  src/BulletDynamics/ConstraintSolver
  src/BulletDynamics/Dynamics
  src/BulletDynamics/Featherstone
  src/BulletDynamics/MLCPSolvers
  src/BulletDynamics/Vehicle
  src/LinearMath
)
set(include_directories 
  src
)
#set(defines )

foreach(DIR ${SRC_DIRS})
  file(GLOB DIR_SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/${DIR}/*.cpp)
  set(SRC_FILES ${SRC_FILES} ${DIR_SOURCE})
endforeach(DIR)

add_library(${PROJECT_NAME} STATIC ${SRC_FILES})
target_include_directories(${PROJECT_NAME} PRIVATE ${include_directories})
#target_compile_definitions(${PROJECT_NAME} PRIVATE ${defines})