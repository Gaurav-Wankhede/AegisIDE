# Universal Machine Learning Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  src/
  ├── pipeline/
  │   ├── data/
  │   │   ├── preprocessing/
  │   │   │   ├── feature_scaling.py   (≤80 lines)
  │   │   │   ├── outlier_removal.py   (≤80 lines)
  │   │   │   └── data_splitter.py     (≤80 lines)
  ```
- **Smallest possible files** - decompose at function, model, and pipeline levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use `__init__.py` files solely for imports and module organization (also ≤80 lines)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy of the same functionalities
- **Use automated duplicate detection tools** before every commit and deployment:
  - **PMD CPD (Copy/Paste Detector)** for fast command-line duplicate detection
  - **pylint** with duplicate code detection enabled
  - **jscpd** for cross-language duplicate detection including Python
  - **Custom Python scripts** using AST parsing for project-specific duplicate detection
- **If any duplicacy found**, optimize immediately without disturbing the system:
  - **Extract common functionality** into shared modules following deep subfolder patterns
  - **Create reusable classes** and functions for common operations like data loading
  - **Implement generic pipelines** using scikit-learn Pipeline or custom classes
  - **Refactor similar model training patterns** into common utilities in `shared/ml/` subfolder
- **Continuous monitoring approach**:
  - Run duplicate detection in **CI/CD pipeline** before merge
  - Set up **pre-commit hooks** with duplicate detection tools
  - Schedule **weekly automated scans** with detailed reports
  - Integrate duplicate detection into **IDE workflow** with custom extensions
- **Optimization strategies**:
  - **Preserve system functionality** during refactoring - never break existing pipelines
  - **Use feature flags** to gradually replace duplicated functionality
  - **Maintain backward compatibility** while optimizing operations
  - **Test thoroughly** after each duplicate removal to ensure system stability

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All numerical values, thresholds, limits, and configuration parameters **must be calculated from real-world data and database queries**
- Use **environment variables** and **configuration files** for all hyperparameters
- Derive parameters from historical data and performance metrics stored in databases
- Calculate timeout values, retry intervals, and connection limits based on observed performance
- Implement dynamic parameter adjustment based on real-time system load and metrics

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** at appropriate places within functionality or **remove entirely**
- Ensure every declared variable serves specific purpose: computation, logging, error handling, or state management
- When implementing stub functions, use variables meaningfully through logging or debug assertions

### Naming Conventions (PEP 8 Compliance)
- Use **descriptive variable names** that convey intent: `featuresAreNormalized`, `modelHasTrained`
- **snake_case** for variables, functions, and module names
- **PascalCase** for class names
- **UPPER_CASE** for constants
- **Descriptive, action-oriented names** for deepest folders
- Follow **domain-driven design** principles in folder hierarchy

### Type Hints and Static Analysis
- **Always use type hints** for function parameters, return values, and variables
- Use **mypy** for static type checking across the entire codebase
- Leverage **typing** module for complex types: `Union`, `Optional`, `List`, `Dict`
- Use **dataclasses** or **NamedTuple** for structured data
- Implement **generic types** where appropriate for reusable components

## Async Programming Standards

### AsyncIO Runtime Management
- Use **asyncio** as async runtime for handling asynchronous tasks and I/O operations
- Implement **async def** syntax with proper error propagation using try/except blocks
- Leverage **asyncio.create_task()** for task spawning and parallel processing
- Use **asyncio.gather()** for concurrent execution of multiple coroutines
- Favor **async context managers** for resource management and cleanup

### Concurrency Patterns
- **asyncio.Queue** for asynchronous producer-consumer patterns in data pipelines
- **asyncio.Event** and **asyncio.Condition** for coordination between training tasks
- **asyncio.Semaphore** for limiting concurrent model evaluations
- **asyncio.Lock** for protecting shared state in distributed training
- Use **asyncio.timeout()** (Python 3.11+) or **asyncio.wait_for()** for timeout handling in inference

### Async Operations
- Implement **retry mechanisms** with exponential backoff for data loading
- Use **aiohttp** or **httpx** for async HTTP requests to external APIs
- Use **asyncio.sleep()** for non-blocking delays in monitoring
- Implement **graceful shutdown** patterns with signal handling for long-running trainings

## Error Handling and Safety

### Exception Management
- Create **custom exception hierarchies** for ML-specific errors (e.g., DataValidationError)
- Use **specific exception types** rather than generic Exception catching
- Implement **proper exception chaining** using `raise ... from ...`
- Handle errors and edge cases early with appropriate exception raising

### Logging and Monitoring
- Use **structured logging** with Python's logging module or MLflow
- Implement **correlation IDs** for tracing experiments across distributed systems
- Use **appropriate log levels**: DEBUG, INFO, WARNING, ERROR, CRITICAL
- Implement **circuit breaker patterns** for external service calls with proper fallback strategies

## Machine Learning Framework Patterns (PyTorch/TensorFlow/Scikit-learn)

### Model Development Patterns
- Structure models using **modular classes** with separate methods for forward pass and training
- Use **pipelines** for data processing and model chaining
- Implement **cross-validation** with proper random states for reproducibility
- Use **hyperparameter tuning** frameworks like Optuna or Hyperopt
- Leverage **experiment tracking** with MLflow or Weights & Biases

### Training and Inference Patterns
- Separate **training** and **inference** logic into distinct modules
- Implement **early stopping** and **checkpointing** for long trainings
- Use **data loaders** with batching and shuffling
- Handle **imbalanced datasets** with appropriate sampling techniques

## Performance Optimization

### Runtime Optimization
- Use **vectorized operations** with NumPy/Pandas
- Implement **distributed training** with Horovod or Ray
- Leverage **GPU acceleration** where appropriate
- Optimize **hyperparameters** for computational efficiency

### Memory Management
- Use **generators** for large datasets to avoid memory overload
- Implement **data chunking** for processing big data
- Monitor **memory usage** with tools like memory_profiler
- Use **weak references** for caching

## Testing Requirements

### Testing Standards
- Write **unit tests** for individual functions and models using pytest
- Implement **integration tests** for full pipelines
- Use **mock datasets** for testing
- Validate **model performance** with metrics assertions
- Achieve **minimum 80% code coverage** with meaningful tests

### Test Organization
- Follow **AAA pattern**: Arrange, Act, Assert
- Use **parametrized tests** for different hyperparameters
- Implement **fixtures** for reusable test data and models
- Test **edge cases** like empty datasets or invalid inputs

## Data and Model Management Patterns

### Data Handling
- Use **Pandas** or **Dask** for data manipulation with proper typing
- Implement **data validation** with Great Expectations or Pandera
- Use **version control** for datasets with DVC
- Handle **data drift** detection in production

### Model Management
- Use **MLflow** or **Kubeflow** for model registry
- Implement **model versioning** and metadata tracking
- Use **ONNX** for model interoperability
- Perform **A/B testing** for model deployments

## Tech Stack Requirements

### Core Dependencies
- **scikit-learn** - classical ML algorithms
- **tensorflow** or **pytorch** - deep learning
- **pandas** and **numpy** - data manipulation
- **mlflow** - experiment tracking
- **optuna** - hyperparameter optimization

### Development Dependencies
- **pytest** - testing framework
- **black** - code formatting
- **mypy** - static type checking
- **dvc** - data version control
- **jupyter** - experimentation notebooks

## Documentation Standards

### Code Documentation
- Use **docstrings** following Google or NumPy style
- Include **type hints** in all function signatures
- Document **model assumptions** and **limitations**
- Use **sphinx** for generating API documentation

### Project Documentation
- Maintain **README** with project overview and setup
- Document **data pipelines** and **model architectures**
- Include **experiment logs** and **results analysis**
- Track **ethical considerations** and **bias mitigation**

## File Organization Rules

### Module Structure
- Separate concerns into logical modules with clear boundaries
- Use **packages** (directories with `__init__.py`) for grouping related modules
- Maintain **consistent depth levels** across similar functionalities
- Follow **microservices decomposition** at every level of the application hierarchy

### Project Layout
```
src/
├── data/           # Data loading and preprocessing
├── models/         # Model definitions and training
├── evaluation/     # Metrics and validation
├── utils/          # Shared utilities
├── notebooks/      # Exploratory analysis
├── tests/          # Test modules
└── config/         # Configuration files
```

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with Python extensions for ML
- **JupyterLab** for interactive development
- **PyCharm** for advanced debugging
- **Colab** for cloud-based experimentation

### Development Workflow
- Use **pre-commit hooks** for quality checks
- Implement **virtual environments** for isolation
- Use **requirements.txt** or **pyproject.toml** for dependencies
- Set up **continuous integration** with testing and linting

## Security and Best Practices

### Security Guidelines
- **Never hardcode secrets** - use environment variables
- Validate **all input data** to prevent injection
- Implement **data privacy** measures like anonymization
- Use **secure random** for sampling

### Code Quality
- Follow **PEP 8** style guidelines
- Use **f-strings** for formatting
- Implement **proper exception handling**
- Use **context managers** for resources
- Avoid **global variables**

## Package Management and Deployment

### Dependency Management
- Use **poetry** or **pipenv** for management
- Pin **exact versions** in production
- Use **virtual environments** for isolation
- Implement **security scanning** for dependencies

### Deployment Patterns
- Use **Docker** for containerized ML services
- Implement **health checks** for models
- Use **Kubernetes** for scaling
- Enable **monitoring** with Prometheus