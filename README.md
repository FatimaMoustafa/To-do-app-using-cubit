# Flutter To Do App

A simple To Do application built using Flutter and Cubit (flutter_bloc).

## Features

- Add Tasks
- Delete Tasks
- Edit Tasks
- Complete Tasks
- Auto UI Update using Cubit
- Separate Pending & Completed Tasks
- Empty State
- Task Creation Date
- Total Task Counter

## Architecture

lib/
│
├── cubit/
├── models/
├── screens/
├── widgets/

The application follows a simple Cubit architecture.

UI
↓
Cubit
↓
State
↓
UI Rebuild

## State Management

flutter_bloc (Cubit)

## Packages

- flutter_bloc
- intl

## Application Flow

1. User enters a task.
2. Cubit creates a new TaskModel.
3. Cubit emits a new state.
4. BlocBuilder rebuilds automatically.
5. User can edit, delete, or complete tasks.
