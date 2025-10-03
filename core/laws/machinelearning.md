---
trigger: glob
globs: *.py,*.ipynb,requirements.txt,environment.yml,Dockerfile,*.yaml,*.json
---

# Universal Machine Learning Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  src/pipeline/data/preprocessing/
  ├── feature_scaling.py   (≤80 lines)
  ├── outlier_removal.py   (≤80 lines)
  └── data_splitter.py     (≤80 lines)
  ```
- **Smallest possible files** - decompose at function, model, and pipeline levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use `__init__.py` files solely for imports and module organization (also ≤80 lines)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: PMD CPD, pylint, jscpd, custom Python AST scripts
- **If any duplicacy found**, optimize immediately: extract common functionality, create reusable classes/functions, implement generic pipelines, refactor model training patterns
- **Continuous monitoring**: CI/CD pipeline, pre-commit hooks, weekly scans, IDE extensions
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All parameters **must be calculated from real-world data and database queries**
- Use **environment variables** and **configuration files** for all hyperparameters
- Derive parameters from historical data and performance metrics
- Implement dynamic parameter adjustment based on real-time system load

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, state management
- When implementing stub functions, use variables meaningfully through logging or debug assertions

### Naming Conventions (PEP 8 Compliance)
- **snake_case** for variables, functions, and module names
- **PascalCase** for class names and models
- **UPPER_CASE** for constants and hyperparameters
- **Descriptive, action-oriented names** for deepest folders
- Follow **domain-driven design** principles in folder hierarchy

### Type Hints and Static Analysis
- **Always use type hints** for function parameters, return values, and class attributes
- Use **mypy** for static type checking across the entire codebase
- Leverage **typing** module: `Union`, `Optional`, `List`, `Dict`, `Tuple`, `Callable`
- Use **numpy typing** for array operations: `np.ndarray[Any, np.dtype[np.float64]]`
- Implement **generic types** for reusable ML components

## Data Pipeline Architecture

### Data Ingestion Patterns
- Use **pandas** for structured data manipulation with proper dtypes
- Implement **data validation** using Great Expectations or Pandera
- Use **async data loading** for large datasets with Dask
- Implement **data versioning** with DVC (Data Version Control)
- Use **streaming data** processing with Apache Kafka or Redis Streams

### Feature Engineering
- Create **feature stores** for reusable feature engineering
- Implement **feature selection** using statistical tests and model-based methods
- Use **feature scaling** and **normalization** consistently
- Implement **categorical encoding** strategies (one-hot, target, embedding)
- Use **time-series feature engineering** for temporal data

### Data Quality and Validation
- Implement **data quality checks** at every pipeline stage
- Use **schema validation** for incoming data
- Implement **outlier detection** and **anomaly detection**
- Use **data profiling** to understand data distributions
- Implement **missing value strategies** based on data context

## Model Development Standards

### Model Architecture
- Use **scikit-learn pipelines** for traditional ML workflows
- Implement **deep learning models** with TensorFlow/Keras or PyTorch
- Use **ensemble methods** for improved performance and robustness
- Implement **hyperparameter optimization** with Optuna or Hyperopt
- Use **cross-validation** strategies appropriate for data type

### Training Patterns
- Implement **reproducible training** with fixed random seeds
- Use **experiment tracking** with MLflow, Weights & Biases, or TensorBoard
- Implement **early stopping** and **learning rate scheduling**
- Use **regularization techniques** to prevent overfitting
- Implement **model checkpointing** for long-running training jobs

### Model Evaluation
- Use **appropriate metrics** for problem type (classification, regression, ranking)
- Implement **cross-validation** with proper data splitting strategies
- Use **statistical significance testing** for model comparisons
- Implement **fairness evaluation** for bias detection
- Use **interpretability tools** like SHAP, LIME, or Permutation Importance

## MLOps and Production Patterns

### Model Versioning and Registry
- Use **MLflow Model Registry** or similar for model versioning
- Implement **model metadata** tracking (performance, features, hyperparameters)
- Use **model lineage** tracking for reproducibility
- Implement **A/B testing** framework for model deployment
- Use **gradual rollouts** for new model deployments

### Model Serving Patterns
- Implement **REST APIs** using FastAPI or Flask for model serving
- Use **containerization** with Docker for consistent deployments
- Implement **batch prediction** pipelines for large-scale inference
- Use **real-time inference** with appropriate latency requirements
- Implement **model monitoring** for performance drift detection

### Infrastructure and Scaling
- Use **Kubernetes** for orchestrating ML workloads
- Implement **auto-scaling** based on inference load
- Use **GPU acceleration** for compute-intensive models
- Implement **distributed training** with multiple GPUs/nodes
- Use **cloud ML services** (AWS SageMaker, GCP AI Platform, Azure ML)

## Experimentation and Research

### Experiment Management
- Use **experiment tracking** tools for all model experiments
- Implement **reproducible experiments** with version control
- Use **configuration management** for experiment parameters
- Implement **experiment comparison** and analysis tools
- Use **collaborative notebooks** with proper documentation

### Research Workflows
- Implement **literature review** processes and paper tracking
- Use **prototype-to-production** pipelines for quick iterations
- Implement **benchmarking** against state-of-the-art methods
- Use **ablation studies** to understand model components
- Implement **statistical analysis** of experimental results

## Testing and Validation

### ML-Specific Testing
- Implement **data tests** for input validation and schema compliance
- Use **model tests** for performance regression detection
- Implement **integration tests** for end-to-end pipeline validation
- Use **property-based testing** for data transformations
- Implement **simulation testing** for model robustness

### Performance Testing
- Test **inference latency** and **throughput** requirements
- Implement **memory usage** monitoring during training and inference
- Use **load testing** for model serving endpoints
- Test **model accuracy** under different data conditions
- Implement **stress testing** for high-volume scenarios

## Monitoring and Observability

### Model Monitoring
- Implement **data drift detection** for input features
- Use **model performance monitoring** in production
- Implement **prediction confidence** monitoring
- Use **feature importance** tracking over time
- Implement **business metric** correlation with model predictions

### System Monitoring
- Monitor **resource utilization** (CPU, GPU, memory)
- Implement **error rate** and **latency** monitoring
- Use **distributed tracing** for complex ML pipelines
- Implement **alerting** for model performance degradation
- Use **dashboard visualization** for real-time monitoring

## Security and Privacy

### Data Privacy
- Implement **data anonymization** and **pseudonymization**
- Use **differential privacy** for sensitive datasets
- Implement **federated learning** for distributed privacy
- Use **secure multi-party computation** when appropriate
- Implement **GDPR compliance** for data handling

### Model Security
- Implement **adversarial robustness** testing
- Use **model watermarking** for intellectual property protection
- Implement **input validation** to prevent injection attacks
- Use **secure model serving** with authentication and authorization
- Implement **model audit trails** for compliance

## Tech Stack Requirements

### Core Dependencies
- **numpy** - numerical computing
- **pandas** - data manipulation
- **scikit-learn** - traditional machine learning
- **tensorflow** or **pytorch** - deep learning
- **matplotlib** and **seaborn** - visualization

### MLOps Dependencies
- **mlflow** - experiment tracking and model registry
- **dvc** - data version control
- **great-expectations** - data validation
- **optuna** - hyperparameter optimization
- **docker** - containerization

### Development Dependencies
- **jupyter** - interactive development
- **pytest** - testing framework
- **black** - code formatting
- **mypy** - type checking
- **pre-commit** - git hooks

## IDE Integration Guidelines

### Universal IDE Compatibility
- **Jupyter Lab/Notebook** for interactive development
- **VS Code** with Python and ML extensions
- **PyCharm Professional** with data science tools
- **Google Colab** for collaborative research
- **Databricks** or **SageMaker Studio** for cloud development

### Development Workflow
- Use **virtual environments** or **conda** for dependency management
- Implement **version control** for code, data, and models
- Use **continuous integration** for automated testing
- Set up **automated documentation** generation
- Use **code quality tools** and **pre-commit hooks**
