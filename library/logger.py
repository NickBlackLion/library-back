import logging
import os

from . import config

formatter = logging.Formatter(config.DEFAULT_LOGGER_FORMAT, config.LOGGER_TIME_FORMAT)
handler = logging.StreamHandler()
handler.setFormatter(formatter)


def get_logger(module_name):
    logger = logging.getLogger(module_name)
    logger.setLevel(int(os.environ.get('LOG_LEVEL', logging.DEBUG)))
    logger.addHandler(handler)
    logger.propagate = False
    return logger
