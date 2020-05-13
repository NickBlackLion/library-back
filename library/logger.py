import logging
import os


def get_logger(module_name):
    default_logger_format = '%(levelname)s:[%(asctime)s] [%(pathname)s:%(lineno)d] - %(message)s'
    logger_time_format = '%d-%m-%Y %H:%M:%S'
    formatter = logging.Formatter(default_logger_format, logger_time_format)
    handler = logging.StreamHandler()
    handler.setFormatter(formatter)
    logger = logging.getLogger(module_name)
    logger.setLevel(int(os.environ.get('LOG_LEVEL', logging.DEBUG)))
    logger.addHandler(handler)
    logger.propagate = False
    return logger
